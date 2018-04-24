import Foundation

class StatsPresenter:StatsPresenterProtocol {
    var outlets:StatsPresenterOutlets
    var collection:StatsPresenterCollection
    
    init() {
        self.outlets = StatsPresenterOutlets()
        self.collection = StatsPresenterCollection()
    }
}
