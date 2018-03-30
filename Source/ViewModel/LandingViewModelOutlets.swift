import Foundation

struct LandingViewModelOutlets {
    var collectionLayout:LandingViewModelCollectionLayout
    var title:String
    var logoHidden:Bool
    var reloadCollection:Bool
    
    init() {
        self.collectionLayout = LandingViewModelCollectionLayout()
        self.title = String()
        self.logoHidden = false
        self.reloadCollection = false
    }
}
