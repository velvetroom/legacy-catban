import Foundation

struct StatsViewModelCollectionItemCompletionFirstOrder:StatsViewModelCollectionItemCompletionProtocol {
    var circles:[StatsViewModelCollectionItemCompletionCircle]
    
    init() {
        self.circles = []
    }
}
