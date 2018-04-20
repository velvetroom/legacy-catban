import UIKit

extension Landing {
    private var collection:LandingViewCollection? {
        get {
            return self.presenter.outlets.list.viewCollection
        }
    }
    
    private var scrollPosition:UICollectionViewScrollPosition {
        get {
            return UICollectionViewScrollPosition([
                UICollectionViewScrollPosition.centeredVertically,
                UICollectionViewScrollPosition.centeredHorizontally])
        }
    }
    
    private var scrollingTopRightRect:CGRect {
        get {
            guard
                let view:UICollectionView = self.collection
            else { return CGRect.zero }
            return CGRect(x:view.contentSize.width - 1, y:0, width:1, height:1)
        }
    }
    
    func scrollToEditingCard() {
        guard
            let editingCard:IndexPath = self.editingCard
        else { return }
        self.collection?.scrollToItem(at:editingCard, at:self.scrollPosition, animated:true)
    }
    
    func scrollToTopRightCorner() {
        self.collection?.scrollRectToVisible(self.scrollingTopRightRect, animated:true)
    }
}
