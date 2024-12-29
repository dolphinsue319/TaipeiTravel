//
//  TTAttractionsViewControllerVM.swift
//  TaipeiTravel
//
//  Created by Kedia on 2024/12/29.
//

import Foundation
import Combine

class TTAttractionsViewControllerVM {

    let didFetchAttractions: PassthroughSubject<Void, Never> = PassthroughSubject()

    init(apiManager: any TTRestfulAPIManager) {
        self.apiManager = apiManager
    }

    var numberOfAttractions: Int { attractionArray.count }

    func attraction(at index: Int) -> TTAttractionModel? {
        if index >= attractionArray.count { return nil }
        return attractionArray[index]
    }

    func fetchAttractions() {
        if fetchingTask != nil { return }
        if let totalAttractions, numberOfAttractions >= totalAttractions { return }
        fetchingTask = Task { [weak self] in
            guard let self else { return }
            do {
                let result = try await apiManager.fetchAttractionArray(at: currentPageIndex, languageCode: .zhTw)
                switch result {
                    case .success(let container):
                    self.currentPageIndex += 1
                    self.totalAttractions = container.total
                    self.attractionArray.append(contentsOf: container.attractionArray)
                    self.didFetchAttractions.send(())
                case .failure(let error):
                    print(error)
                }
                self.fetchingTask = nil
            } catch {
                print(error)
                self.fetchingTask = nil
            }
            return
        }
    }

    // MARK: - Privates
    // 因為 TTRestfulAPIManager 是個 prtotocol, 所以可以用 DI 的方式實作 unit test
    private let apiManager: any TTRestfulAPIManager
    private var totalAttractions: Int?
    private var attractionArray: [TTAttractionModel] = .init()
    private var currentPageIndex: Int = 1
    private var fetchingTask: Task<Sendable, Error>?
}
