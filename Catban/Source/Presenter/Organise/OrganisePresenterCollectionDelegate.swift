import UIKit

class OrganisePresenterCollectionDelegate:NSObject, OrganisePresenterCollectionDelegateProtocol {
    weak var delegate:OrganisePresenterCollectionDelegateDelegateProtocol?
    
    func collectionView(_ view:UICollectionView, layout:UICollectionViewLayout, sizeForItemAt:IndexPath) -> CGSize {
        return CGSize(width:view.bounds.width, height:Constants.cellHeight)
    }
    
    func collectionView(_:UICollectionView, didSelectItemAt index:IndexPath) {
        self.delegate?.delegateSelectCellAt(index:index)
    }
}
