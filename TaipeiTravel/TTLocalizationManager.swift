//
//  TTLocalizationManager.swift
//  TaipeiTravel
//
//  Created by Kedia on 2025/1/1.
//

import Foundation
import Combine

class TTLocalizationManager {

    static let shared = TTLocalizationManager()
    let userPreferredLanguageDidChangeSubject: CurrentValueSubject<TTLocalization, Never>
    let languages: [TTLocalization] = [.zhTw, .zhCn, .en, .ja, .ko, .es, .th, .vi]

    var userPreferredLanguage: TTLocalization = TTLocalizationManager.systemPreferredLanguage {
        didSet {
            userPreferredLanguageDidChangeSubject.send(userPreferredLanguage)
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
        self.userPreferredLanguageDidChangeSubject = .init(TTLocalizationManager.systemPreferredLanguage)
    }
}