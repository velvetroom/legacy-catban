import UIKit

class LandingCollectionDelegate:NSObject, LandingCollectionDelegateProtocol {
    var viewModel:LandingViewModelCollection
    
    override init() {
        self.viewModel = LandingViewModelCollection()
        super.init()
    }
    
    func collectionView(_:UICollectionView, numberOfItemsInSection section:Int) -> Int {
        return 0
    }
    
    func collectionView(_:UICollectionView, cellForItemAt index:IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}
