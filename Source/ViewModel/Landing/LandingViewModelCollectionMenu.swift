import UIKit

struct LandingViewModelCollectionMenu {
    var layoutBottom:CGFloat
    var moveRightEnabled:Bool
    var moveLeftEnabled:Bool
    
    init() {
        self.layoutBottom = LandingController.Constants.collectionMenuHeight
        self.moveRightEnabled = false
        self.moveLeftEnabled = false
    }
}
