import Foundation

struct LandingViewModel {
    var collection:LandingViewModelCollection
    var collectionLayout:LandingViewModelCollectionLayout
    var logoHidden:Bool
    
    init() {
        self.collection = LandingViewModelCollection()
        self.collectionLayout = LandingViewModelCollectionLayout()
        self.logoHidden = false
    }
}
