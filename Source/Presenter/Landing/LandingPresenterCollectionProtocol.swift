import UIKit

protocol LandingPresenterCollectionProtocol:
UICollectionViewDelegate, UICollectionViewDataSource, UIGestureRecognizerDelegate {
    var viewModel:LandingViewModelCollection { get set }
}
