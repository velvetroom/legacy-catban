import Foundation

struct StatsViewModelCollectionItemCompletionThirdOrder:StatsViewModelCollectionItemCompletionProtocol {
    var circles:[StatsViewModelCollectionItemCompletionCircle]
    
    init() {
        self.circles = []
    }
}
