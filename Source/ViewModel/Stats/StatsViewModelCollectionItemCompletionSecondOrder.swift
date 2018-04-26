import Foundation

struct StatsViewModelCollectionItemCompletionSecondOrder:StatsViewModelCollectionItemCompletionProtocol {
    var circles:[StatsViewModelCollectionItemCompletionCircle]
    
    init() {
        self.circles = []
    }
}
