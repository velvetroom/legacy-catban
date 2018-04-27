import UIKit
@testable import catban

class MockCollectionUpdateProtocol:CollectionUpdateProtocol {
    var onStrategyBoard:((BoardProtocol) -> Void)?
    var onStrategyCollection:((UICollectionView) -> Void)?
    
    func strategy(board:BoardProtocol) {
        self.onStrategyBoard?(board)
    }
    
    func strategy(collectionView:UICollectionView) {
        self.onStrategyCollection?(collectionView)
    }
}
