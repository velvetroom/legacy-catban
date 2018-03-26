import UIKit

class LandingViewCollectionLayout:UICollectionViewLayout {
    var viewModel:LandingViewModelCollectionLayout
    
    override init() {
        self.viewModel = LandingViewModelCollectionLayout()
        super.init()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
}
