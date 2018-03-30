import UIKit

struct LandingViewModelOutlets {
    var collectionLayout:LandingViewModelCollectionLayout
    var collectionMenuBottom:CGFloat
    var title:String
    var logoHidden:Bool
    var reloadCollection:Bool
    
    init() {
        self.collectionLayout = LandingViewModelCollectionLayout()
        self.collectionMenuBottom = LandingController.Constants.collectionMenuHeight
        self.title = String()
        self.logoHidden = false
        self.reloadCollection = false
    }
}
