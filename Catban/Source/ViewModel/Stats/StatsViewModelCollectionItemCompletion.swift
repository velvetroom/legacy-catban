import Foundation

struct StatsViewModelCollectionItemCompletion:StatsViewModelCollectionItemProtocol {
    var circles:[CircleViewModel]
    
    init() {
        self.circles = []
    }
}
