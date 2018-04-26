import Foundation

struct StatsViewModelCollectionItemCompletionSecondOrder:StatsViewModelCollectionItemCompletionProtocol {
    var circles:[CircleViewModel]
    
    init() {
        self.circles = []
    }
}
