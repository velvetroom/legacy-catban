import UIKit

class StatsPresenterCollectionDelegate:NSObject, StatsPresenterCollectionDelegateProtocol {
    func collectionView(_:UICollectionView, shouldSelectItemAt:IndexPath) -> Bool {
        return false
    }
    
    func collectionView(_:UICollectionView, shouldHighlightItemAt:IndexPath) -> Bool {
        return false
    }
    
    func collectionView(_ view:UICollectionView, layout:UICollectionViewLayout,
                        sizeForItemAt:IndexPath) -> CGSize {
        return CGSize(width:view.frame.width, height:view.frame.height)
    }
}
