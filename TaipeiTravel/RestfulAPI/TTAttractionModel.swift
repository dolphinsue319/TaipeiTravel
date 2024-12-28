//
//  TTAractionModel.swift
//  TaipeiTravel
//
//  Created by Kedia on 2024/12/27.
//

import Foundation

// 採用 POP, 將介面與實作切割開來，這樣一來不論以後 API response 怎麼變，都只需要改這個實作的部份，不會影響到其他 .swift 檔
protocol TTAttractionModel {
    var id: Int { get }
    var name: String { get }
    var introduction: String? { get }
    var urlString: String? { get }
    var imageURLStringArray: [String]? { get }
}

struct TTAttractionModelImageModel: Decodable {
    enum ImageType {
        case jpg
        case png
    }

    enum CodingKeys: String, CodingKey {
        case urlString = "src"
        case imageTypeString = "ext"
    }

    let urlString: String
    let imageTypeString: String?
    // 假設只會有 .jpg & .png
    var imageType: ImageType? {
        get {
            switch imageTypeString {
            case ".jpg":
                return .jpg
            case ".png":
                return .png
            default:
                return nil
            }
        }
    }
}

struct TTAttractionModelImpl: TTAttractionModel, Decodable {
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case introduction
        case url
        case originalImageArray = "images"
    }
    let id : Int
    let name : String
    let introduction: String?
    let urlString: String?
    let imageURLStringArray: [String]?
    private let originalImageArray: [TTAttractionModelImageModel]?

    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        // 清理 introduction 中的 \r\n
        if let rawIntroduction = try? container.decode(String.self, forKey: .introduction) {
            introduction = rawIntroduction.removingCarriageReturnsAndNewLines()
        } else {
            introduction = nil
        }
        urlString = try container.decodeIfPresent(String.self, forKey: .url)
        guard let imageModelArray = try container.decodeIfPresent([TTAttractionModelImageModel].self, forKey: .originalImageArray) else {
            originalImageArray = nil
            imageURLStringArray = nil
            return
        }
        originalImageArray = imageModelArray
        imageURLStringArray = imageModelArray.compactMap(\.urlString)
    }
}
