import Foundation
@testable import catban

class MockStatsPresenterProtocol:StatsPresenterProtocol {
    var outlets:StatsPresenterOutlets
    var collection:StatsPresenterCollection
    
    init() {
        self.outlets = StatsPresenterOutlets()
        self.collection = StatsPresenterCollection()
    }
}
