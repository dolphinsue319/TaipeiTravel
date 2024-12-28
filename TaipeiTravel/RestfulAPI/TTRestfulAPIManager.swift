//
//  TTRestfulAPIManager.swift
//  TaipeiTravel
//
//  Created by Kedia on 2024/12/28.
//

import Foundation

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
    func fetchAttractionArray(at pageIndex: Int) async throws -> Result<any TTAttractionResponseContainer, TTError>
}

class TTRestfulAPIManagerImpl: TTRestfulAPIManager {

    func fetchAttractionArray(at pageIndex: Int) async -> Result<any TTAttractionResponseContainer, TTError> {
        
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)

        guard let url = URL(string: "https://www.travel.taipei/open-api/zh-tw/Attractions/All?page=\(pageIndex)") else {
            return .failure(.invalidURL)
        }

        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        do {
            let (data, response) = try await session.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                return .failure(.invalidServerResponse)
            }
            
            let decoder = JSONDecoder()
            let attractionResponse = try decoder.decode(TTAttractionResponseContainerImpl.self, from: data)

            return .success(attractionResponse)
        } catch {
            return .failure(.URLSessionError(error))
        }
    }
}
