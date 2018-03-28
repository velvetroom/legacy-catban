import UIKit

class LandingPresenterCollectionDelegate:NSObject, UICollectionViewDelegate {
    func collectionView(_:UICollectionView,
                        targetIndexPathForMoveFromItemAt index:IndexPath,
                        toProposedIndexPath proposed:IndexPath) -> IndexPath {
        return IndexPath(item:proposed.item, section:index.section)
    }
}
