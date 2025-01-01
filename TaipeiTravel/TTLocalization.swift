//
//  TTLocalization.swift
//  TaipeiTravel
//
//  Created by Kedia on 2024/12/29.
//

import Foundation

// 在 Attractions/All 那支 API 裡，已經沒有印尼文的參數了，所以這裡也不實作印尼文
enum TTLocalization: CustomStringConvertible {
    case zhTw
    case zhCn
    case en
    case ja
    case ko
    case es
    case th
    case vi

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

    var description: String {
        switch self {
        case .zhTw: return "繁體中文"
        case .zhCn: return "简体中文"
        case .en: return "English"
        case .ja: return "日本語"
        case .ko: return "한국어"
        case .es: return "Español"
        case .th: return "ภาษาไทย"
        case .vi: return "Tiếng Việt"
        }
    }
}
