import Foundation

struct StatsViewModel {
    var collection:StatsViewModelCollection
    var pageControl:StatsViewModelPageControl
    
    init() {
        self.collection = StatsViewModelCollection()
        self.pageControl = StatsViewModelPageControl()
    }
}
