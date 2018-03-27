import UIKit

protocol LandingPresenterCollectionProtocol:UICollectionViewDelegate, UICollectionViewDataSource {
    var viewModel:LandingViewModelCollection { get set }
}
