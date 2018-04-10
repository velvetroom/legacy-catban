import UIKit
@testable import catban

class MockCollectionUpdateProtocol:CollectionUpdateProtocol {
    var onStrategy:((UICollectionView) -> Void)?
    
    func strategy(collectionView:UICollectionView) {
        self.onStrategy?(collectionView)
    }
}
