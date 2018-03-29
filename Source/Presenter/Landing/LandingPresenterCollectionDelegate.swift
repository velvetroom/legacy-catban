import UIKit

class LandingPresenterCollectionDelegate:NSObject, UICollectionViewDelegate {
    weak var delegate:LandingPresenterCollectionDelegateProtocol?
    
    func collectionView(_ collection:UICollectionView,
                        targetIndexPathForMoveFromItemAt index:IndexPath,
                        toProposedIndexPath proposed:IndexPath) -> IndexPath {
        let section:Int = index.section
        let maxItemsInSection:Int = collection.numberOfItems(inSection:section)
        var proposedItem:Int = proposed.item
        if proposedItem >= maxItemsInSection {
            proposedItem = maxItemsInSection - 1
        }
        return IndexPath(item:proposedItem, section:section)
    }
    
    func collectionView(_:UICollectionView, didSelectItemAt index:IndexPath) {
        self.delegate?.delegateSelectCellAt(index:index)
    }
    
    func collectionView(_:UICollectionView, didDeselectItemAt _:IndexPath) {
        self.delegate?.delegateDeselectCell()
    }
}
