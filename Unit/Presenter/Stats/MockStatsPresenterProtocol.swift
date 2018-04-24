import Foundation
@testable import catban

class MockStatsPresenterProtocol:StatsPresenterProtocol {
    var onUpdateWidthBoard:((BoardProtocol) -> Void)?
    var outlets:StatsPresenterOutlets
    var collection:StatsPresenterCollection
    var factory:StatsPresenterFactoryProtocol
    
    init() {
        self.outlets = StatsPresenterOutlets()
        self.collection = StatsPresenterCollection()
        self.factory = StatsPresenterFactory()
    }
    
    func updateWith(board:BoardProtocol) {
        self.onUpdateWidthBoard?(board)
    }
}
