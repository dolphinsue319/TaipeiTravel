//
//  StringExtension.swift
//  TaipeiTravel
//
//  Created by Kedia on 2024/12/28.
//

import Foundation

extension String {
    /// Removes all occurrences of "\r\n" from the string.
    func removingCarriageReturnsAndNewLines() -> String {
        return self.replacingOccurrences(of: "\r\n", with: "")
    }
}
