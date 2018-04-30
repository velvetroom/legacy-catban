import UIKit
@testable import catban

class MockStatsItemProtocol:StatsItemProtocol {
    func factoryViewWith(project:ProjectProtocol) -> UIView {
        return MockStatsView()
    }
}
