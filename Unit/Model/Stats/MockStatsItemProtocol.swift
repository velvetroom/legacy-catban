import Foundation
@testable import catban

class MockStatsItemProtocol:StatsItemProtocol {
    func factoryViewWith(project:ProjectProtocol) -> StatsView {
        return MockStatsView()
    }
}
