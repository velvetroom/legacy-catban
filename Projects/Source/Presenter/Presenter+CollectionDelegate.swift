import UIKit

extension Presenter:UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {    
    var centerIndexPath:IndexPath? {
        get {
//            return self.view.indexPathForItem(at:self.centerPoint)
            return IndexPath(item:0, section:0)
        }
    }
    
    private var centerPoint:CGPoint {
        get {
//            let halfHeight:CGFloat = self.view.bounds.height / 2.0
//            return CGPoint(x:0, y:halfHeight + self.view.contentOffset.y)
            return CGPoint.zero
        }
    }
    
    private var centerCell:UICollectionViewCell? {
        get {
//            guard
//                let indexPath:IndexPath = self.centerIndexPath
//            else { return nil }
//            return self.view.cellForItem(at:indexPath)
            return nil
        }
    }
    
    public func scrollViewWillBeginDragging(_:UIScrollView) {
        self.state.trackingScroll = true
    }
    
    public func scrollViewDidScroll(_ view:UIScrollView) {
        let view:UICollectionView = view as! UICollectionView
        self.updateSelectorWith(view:view)
        if self.state.trackingScroll {
            self.selectCentreFrom(view:view)
        }
    }
    
    public func collectionView(_ view:UICollectionView, layout:UICollectionViewLayout,
                               insetForSectionAt:Int) -> UIEdgeInsets {
        let margin:CGFloat = (view.bounds.height - ViewConstants.ListItem.height) / 2.0
        return UIEdgeInsets(top:margin, left:0, bottom:margin, right:0)
    }
    
    public func collectionView(_ view:UICollectionView, layout:UICollectionViewLayout,
                               sizeForItemAt:IndexPath) -> CGSize {
        return CGSize(width:view.bounds.width, height:ViewConstants.ListItem.height)
    }
    
    public func collectionView(_ view:UICollectionView, didSelectItemAt indexPath:IndexPath) {
        self.state.selected = self.identifierFor(indexPath:indexPath)
        self.state.trackingScroll = false
        view.scrollToItem(at:indexPath, at:UICollectionViewScrollPosition.centeredVertically, animated:true)
    }
    
    private func selectCentreFrom(view:UICollectionView) {
        guard
            let indexPath:IndexPath = self.centreIndexFrom(view:view)
            else { return }
        self.state.selected = self.identifierFor(indexPath:indexPath)
        view.selectItem(at:indexPath, animated:false, scrollPosition:UICollectionViewScrollPosition())
    }
    
    private func updateSelectorWith(view:UICollectionView) {
        var centreY:CGFloat
        if let cell:UICollectionViewCell = self.centreCellFrom(view:view) {
            centreY = cell.center.y
        } else {
            centreY = view.bounds.midY
        }
        var viewModel:ViewModelSelector = self.viewModel.property()
        viewModel.positionY = centreY - view.contentOffset.y
        self.viewModel.update(property:viewModel)
    }
    
    private func centreCellFrom(view:UICollectionView) -> UICollectionViewCell? {
        guard
            let indexPath:IndexPath = self.centreIndexFrom(view:view)
        else { return nil }
        return view.cellForItem(at:indexPath)
    }
    
    private func centreIndexFrom(view:UICollectionView) -> IndexPath? {
        let halfHeight:CGFloat = view.bounds.height / 2.0
        let centre:CGPoint = CGPoint(x:0, y:halfHeight + view.contentOffset.y)
        return view.indexPathForItem(at:centre)
    }
}
