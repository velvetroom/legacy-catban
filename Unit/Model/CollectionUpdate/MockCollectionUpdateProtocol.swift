import UIKit
@testable import catban

class MockCollectionUpdateProtocol:CollectionUpdateProtocol {
    var onStrategyProject:((Project) -> Void)?
    var onStrategyCollection:((UICollectionView) -> Void)?
    
    func strategy(project:Project) {
        self.onStrategyProject?(project)
    }
    
    func strategy(collectionView:UICollectionView) {
        self.onStrategyCollection?(collectionView)
    }
}
