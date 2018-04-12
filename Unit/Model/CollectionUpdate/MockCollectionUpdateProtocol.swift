import UIKit
@testable import catban

class MockCollectionUpdateProtocol:CollectionUpdateProtocol {
    var onStrategyProject:((ProjectProtocol) -> Void)?
    var onStrategyCollection:((UICollectionView) -> Void)?
    
    func strategy(project:ProjectProtocol) {
        self.onStrategyProject?(project)
    }
    
    func strategy(collectionView:UICollectionView) {
        self.onStrategyCollection?(collectionView)
    }
}
