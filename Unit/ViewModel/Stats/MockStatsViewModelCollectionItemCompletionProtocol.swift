import UIKit
@testable import catban

struct MockStatsViewModelCollectionItemCompletionProtocol:
StatsViewModelCollectionItemCompletionProtocol {
    var circles:[CircleViewModel]
    
    init() {
        self.circles = []
    }
}
