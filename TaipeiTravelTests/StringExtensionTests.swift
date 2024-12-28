//
//  StringExtensionTests.swift
//  TaipeiTravelTests
//
//  Created by Kedia on 2024/12/28.
//

import Testing

struct StringExtensionTests {

    @Test func removesCarriage() async throws {
        let originalString = "Hello\r\nWorld\r\nThis is a test."
        let cleanedString = originalString.removingCarriageReturnsAndNewLines()
        #expect(cleanedString == "HelloWorldThis is a test.")
    }

}
