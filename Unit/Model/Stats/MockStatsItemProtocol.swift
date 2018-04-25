import Foundation
@testable import catban

class MockStatsItemProtocol:StatsItemProtocol {
    func factoryViewModelWith(project:ProjectProtocol) -> StatsViewModelCollectionItemProtocol {
        return MockStatsViewModelCollectionItemProtocol()
    }
}
