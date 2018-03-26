import Foundation

struct LandingViewModel {
    var outlets:LandingViewModelOutlets
    var collection:LandingViewModelCollection
    var collectionLayout:LandingViewModelCollectionLayout
    
    init() {
        self.outlets = LandingViewModelOutlets()
        self.collection = LandingViewModelCollection()
        self.collectionLayout = LandingViewModelCollectionLayout()
    }
}
