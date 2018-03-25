import UIKit

protocol LandingCollectionDelegateProtocol:UICollectionViewDelegate, UICollectionViewDataSource {
    var viewModel:LandingViewModelCollection { get set }
}
