import UIKit

class OrganisePresenterCollectionDelegate:NSObject, OrganisePresenterCollectionDelegateProtocol {
    func collectionView(_ view:UICollectionView, layout:UICollectionViewLayout, sizeForItemAt:IndexPath) -> CGSize {
        return CGSize(width:view.bounds.width, height:Constants.cellHeight)
    }
    
    func collectionView(_:UICollectionView, shouldSelectItemAt:IndexPath) -> Bool {
        return false
    }
    
    func collectionView(_:UICollectionView, shouldHighlightItemAt:IndexPath) -> Bool {
        return false
    }
}
