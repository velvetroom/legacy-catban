import UIKit

class StatsPresenterCollectionDelegate:NSObject, StatsPresenterCollectionDelegateProtocol {
    func collectionView(_:UICollectionView, shouldSelectItemAt:IndexPath) -> Bool {
        return false
    }
    
    func collectionView(_:UICollectionView, shouldHighlightItemAt:IndexPath) -> Bool {
        return false
    }
}
