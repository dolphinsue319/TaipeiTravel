//
//  TTAttractionsViewControllerVMTests.swift
//  TaipeiTravelTests
//
//  Created by Kedia on 2024/12/29.
//

import Testing
import Combine

fileprivate let pageSize = 10

class TTAttractionsViewControllerVMTests {

    private var subscriptions: Set<AnyCancellable> = .init()

    @Test func fetchAttractions() async throws {
        let vm = TTAttractionsViewControllerVM(apiManager: APIManagerMock())
        vm.fetchAttractions()
        vm.didFetchAttractions.sink {
            #expect(vm.numberOfAttractions == pageSize)
            for i in 0..<pageSize {
                let attraction = vm.attraction(at: i)
                #expect(attraction?.id == i)
            }
        }.store(in: &subscriptions)
    }

}

// MARK: Mocks
fileprivate struct TTAttractionModelMock: TTAttractionModel {
    var id: Int
    var name: String
    var introduction: String?
    var urlString: String?
    var imageURLStringArray: [String]?
}

fileprivate struct TTAttractionResponseContainerMock: TTAttractionResponseContainer {
    var attractionArray: [any TTAttractionModel]
    var total: Int
}

fileprivate struct APIManagerMock: TTRestfulAPIManager {

    func fetchAttractionArray(at pageIndex: Int, localization: TTLocalization) async throws -> Result<any TTAttractionResponseContainer, TTError> {
        var attractionArray: [TTAttractionModelMock] = []

        for i in 0..<pageSize {
            attractionArray.append(TTAttractionModelMock(id: i, name: "Attraction \(i)", introduction: nil, urlString: nil, imageURLStringArray: nil))
        }
        let container = TTAttractionResponseContainerMock(attractionArray: attractionArray, total: pageSize)
        return .success(container)
    }
    

}
