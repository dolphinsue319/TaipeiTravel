//
//  TTRestfulAPIManager.swift
//  TaipeiTravel
//
//  Created by Kedia on 2024/12/28.
//

import Foundation

enum TTRestfulAPILanguageCode: String {
    case zhTw = "zh-tw"
    case zhCn = "zh-cn"
    case en = "en"
    case ja = "ja"
    case ko = "ko"
    case es = "es"
    case id = "id"
    case th = "th"
    case vi = "vi"
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
    static func fetchAttractionArray(at pageIndex: Int, languageCode: TTRestfulAPILanguageCode) async throws -> Result<any TTAttractionResponseContainer, TTError>
}

class TTRestfulAPIManagerImpl: TTRestfulAPIManager {

    static func fetchAttractionArray(at pageIndex: Int, languageCode: TTRestfulAPILanguageCode) async -> Result<any TTAttractionResponseContainer, TTError> {

        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)

        guard let url = URL(string: "https://www.travel.taipei/open-api/\(languageCode.rawValue)/Attractions/All?page=\(pageIndex)") else {
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
