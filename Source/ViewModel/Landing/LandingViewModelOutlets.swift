import UIKit

struct LandingViewModelOutlets {
    var collectionLayout:LandingViewModelCollectionLayout
    var collectionMenu:LandingViewModelCollectionMenu
    var title:String
    var logoHidden:Bool
    var reloadCollection:Bool
    
    init() {
        self.collectionLayout = LandingViewModelCollectionLayout()
        self.collectionMenu = LandingViewModelCollectionMenu()
        self.title = String()
        self.logoHidden = false
        self.reloadCollection = false
    }
}
