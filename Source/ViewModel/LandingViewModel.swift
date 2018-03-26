import Foundation

struct LandingViewModel {
    var collection:LandingViewModelCollection
    var collectionLayout:LandingViewModelCollectionLayout
    var title:String
    var logoHidden:Bool
    
    init() {
        self.collection = LandingViewModelCollection()
        self.collectionLayout = LandingViewModelCollectionLayout()
        self.title = String()
        self.logoHidden = false
    }
}
