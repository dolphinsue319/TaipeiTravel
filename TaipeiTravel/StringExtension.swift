//
//  StringExtension.swift
//  TaipeiTravel
//
//  Created by Kedia on 2024/12/28.
//

import Foundation

// 因為 RestfulAPI 回傳的字串裡可能有 \r\n，它會造成 JSON decode 失敗，所以要先將 \r\n 改成 \\n
extension String {
    /// Removes all occurrences of "\r\n" from the string.
    func removingCarriageReturnsAndNewLines() -> String {
        return self.replacingOccurrences(of: "\r\n", with: "\\n")
    }
}
