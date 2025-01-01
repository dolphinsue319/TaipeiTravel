//
//  TTRestfulAPIManager.swift
//  TaipeiTravel
//
//  Created by Kedia on 2024/12/28.
//

import Foundation

private extension TTLocalization {
    var languageCode: String {
        switch self {
        case .zhTw:
            return "zh-tw"
        case .zhCn:
            return "zh-cn"
        case .en:
            return"en"
        case .ja:
            return"ja"
        case .ko:
            return "ko"
        case .es:
            return "es"
        case .th:
            return "th"
        case .vi:
            return "vi"
        }
    }
}

protocol TTAttractionResponseContainer {
    var attractionArray: [any TTAttractionModel] { get }
    var total: Int { get }
}

struct TTAttractionResponseContainerImpl: TTAttractionResponseContainer, Decodable {
    let attractionArray: [any TTAttractionModel]
    let total: Int
    enum CodingKeys: String, CodingKey {
        case attractionArray = "data"
        case total
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        attractionArray = try container.decode([TTAttractionModelImpl].self, forKey: .attractionArray)
        total = try container.decode(Int.self, forKey: .total)
    }
}

protocol TTRestfulAPIManager {
    /// page index 從 1 開始
    func fetchAttractionArray(at pageIndex: Int, localization: TTLocalization) async throws -> Result<any TTAttractionResponseContainer, TTError>
}

class TTRestfulAPIManagerImpl: TTRestfulAPIManager {

    func fetchAttractionArray(at pageIndex: Int, localization: TTLocalization) async -> Result<any TTAttractionResponseContainer, TTError> {

        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)

        guard let url = URL(string: "https://www.travel.taipei/open-api/\(localization.languageCode)/Attractions/All?page=\(pageIndex)") else {
            return .failure(.invalidURL)
        }

        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Accept")

        do {
            let (data, response) = try await session.data(for: request)

            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                return .failure(.invalidServerResponse)
            }

            do {
                let decoder = JSONDecoder()
                let attractionResponse = try decoder.decode(TTAttractionResponseContainerImpl.self, from: data)
                return .success(attractionResponse)
            } catch let decodingError as DecodingError {
                // 處理 JSON 解碼錯誤
                return .failure(.invalidJSON(decodingError))
            }
        } catch let urlSessionError as URLError {
            // 處理 URLSession 錯誤
            return .failure(.URLSessionError(urlSessionError))
        } catch {
            // 處理其他錯誤
            return .failure(.unknown(error))
        }
    }
}
