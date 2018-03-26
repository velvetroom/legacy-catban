import UIKit

class LandingViewCollectionLayout:UICollectionViewLayout {
    var viewModel:LandingViewModelLayout
    
    override init() {
        self.viewModel = LandingViewModelLayout()
        super.init()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
}
