//
//  TTLocalization.swift
//  TaipeiTravel
//
//  Created by Kedia on 2024/12/29.
//

import Foundation

// 在 Attractions/All 那支 API 裡，已經沒有印尼文的參數了，所以這裡也不實作印尼文
enum TTLocalization {
    case zhTw
    case zhCn
    case en
    case ja
    case ko
    case es
    case th
    case vi
}

class TTLocalizationManager {

    static let shared = TTLocalizationManager()

    var userPreferredLanguage: TTLocalization = TTLocalizationManager.systemPreferredLanguage {
        didSet {
#warning("發出通知")
        }
    }

    static var systemPreferredLanguage: TTLocalization {
        switch Locale.preferredLanguages.first?.lowercased() {
        case "zh-hant-tw": return .zhTw
        case "zh-hans": return .zhCn
        case "ja": return .ja
        case "ko": return .ko
        case "es": return .es
        case "th": return .th
        case "vi": return .vi
        default: return .en
        }
    }

    private init() {
        
    }
}
