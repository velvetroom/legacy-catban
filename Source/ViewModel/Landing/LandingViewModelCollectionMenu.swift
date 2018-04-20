import UIKit

struct LandingViewModelCollectionMenu {
    var layoutBottom:CGFloat
    var moveRightEnabled:Bool
    var moveLeftEnabled:Bool
    
    init() {
        self.layoutBottom = LandingViewModel.Constants.collectionMenuHeight
        self.moveRightEnabled = false
        self.moveLeftEnabled = false
    }
}
