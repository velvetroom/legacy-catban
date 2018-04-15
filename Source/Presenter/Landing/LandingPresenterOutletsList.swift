import UIKit

struct LandingPresenterOutletsList {
    weak var controller:LandingController?
    weak var viewCollection:LandingViewCollection?
    weak var viewCollectionMenu:LandingViewCollectionMenu?
    weak var layoutCollection:LandingViewCollectionLayout?
    weak var gestureCollection:UILongPressGestureRecognizer?
    weak var layoutCollectionMenuBottom:NSLayoutConstraint?
    weak var buttonCollectionMenuMoveRight:UIButton?
    weak var buttonCollectionMenuMoveLeft:UIButton?
    weak var buttonCollectionMenuEdit:UIButton?
}
