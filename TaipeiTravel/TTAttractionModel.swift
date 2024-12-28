//
//  TTAractionModel.swift
//  TaipeiTravel
//
//  Created by Kedia on 2024/12/27.
//

import Foundation

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

struct TTAttractionModelImpl: Decodable {
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
    let url: String?
    private let originalImageArray: [TTAttractionModelImageModel]?
    let imageURLStringArray: [String]?

    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        introduction = try container.decode(String.self, forKey: .introduction)
        url = try container.decodeIfPresent(String.self, forKey: .url)
        guard let imageModelArray = try container.decodeIfPresent([TTAttractionModelImageModel].self, forKey: .originalImageArray) else {
            originalImageArray = nil
            imageURLStringArray = nil
            return
        }
        originalImageArray = imageModelArray
        imageURLStringArray = imageModelArray.compactMap(\.urlString)
    }
}
