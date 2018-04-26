import UIKit
@testable import catban

struct MockStatsViewModelCollectionItemCompletionProtocol:
StatsViewModelCollectionItemCompletionProtocol {
    var circles:[StatsViewModelCollectionItemCompletionCircle]
    
    init() {
        self.circles = []
    }
}
