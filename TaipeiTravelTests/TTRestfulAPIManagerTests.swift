//
//  TTRestfulAPIManagerTests.swift
//  TaipeiTravelTests
//
//  Created by Kedia on 2024/12/28.
//

import Testing

struct TTRestfulAPIManagerTests {

    @Test func fetchAttractionArray() async throws {
        let result = await TTRestfulAPIManagerImpl().fetchAttractionArray(at: 1)
        switch result {
        case .success(let success):
            #expect(success.attractionArray.count > 0)
        case .failure(let error):
            assertionFailure("fetchAttractionArray failed: \(error)")
        }
    }

}
