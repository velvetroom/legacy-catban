import Foundation

struct LandingViewModel {
    var outlets:LandingViewModelOutlets
    var collection:LandingViewModelCollection
    
    init() {
        self.outlets = LandingViewModelOutlets()
        self.collection = LandingViewModelCollection()
    }
}
