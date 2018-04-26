import Foundation

struct StatsViewModelCollectionItemCompletionFirstOrder:StatsViewModelCollectionItemCompletionProtocol {
    var circles:[CircleViewModel]
    
    init() {
        self.circles = []
    }
}
