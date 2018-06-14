import UIKit

extension Presenter:UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {    
    var centerIndexPath:IndexPath? {
        get {
            return self.view.indexPathForItem(at:self.centerPoint)
        }
    }
    
    private var centerPoint:CGPoint {
        get {
            let halfHeight:CGFloat = self.view.bounds.height / 2.0
            return CGPoint(x:0, y:halfHeight + self.view.contentOffset.y)
        }
    }
    
    private var centerCell:UICollectionViewCell? {
        get {
            guard
                let indexPath:IndexPath = self.centerIndexPath
            else { return nil }
            return self.view.cellForItem(at:indexPath)
        }
    }
    
    func updateSelector() {
        var centreY:CGFloat
        if let cell:UICollectionViewCell = self.centerCell {
            centreY = cell.center.y
        } else {
            centreY = self.view.bounds.midY
        }
        self.view.viewSelector.layoutY.constant = centreY - self.view.contentOffset.y
        self.animateSelector()
    }
    
    func selectCentreCell() {
        guard
            let indexPath:IndexPath = self.centerIndexPath
        else { return }
        let item:ViewModelItem = self.viewModel.items[indexPath.item]
        self.interactor.stateSelecting(index:indexPath.item, identifier:item.identifier)
        self.view.selectItem(at:indexPath, animated:false, scrollPosition:UICollectionViewScrollPosition())
    }
    
    public func scrollViewWillBeginDragging(_:UIScrollView) {
        self.view.trackingScroll = true
    }
    
    public func scrollViewDidScroll(_:UIScrollView) {
        self.updateSelector()
        if self.view.trackingScroll {
            self.selectCentreCell()
        }
    }
    
    public func collectionView(_:UICollectionView, layout:UICollectionViewLayout,
                               insetForSectionAt:Int) -> UIEdgeInsets {
        let margin:CGFloat = (self.view.bounds.height - ViewConstants.ListItem.height) / 2.0
        return UIEdgeInsets(top:margin, left:0, bottom:margin, right:0)
    }
    
    public func collectionView(_:UICollectionView, layout:UICollectionViewLayout, sizeForItemAt:IndexPath) -> CGSize {
        return CGSize(width:self.view.bounds.width, height:ViewConstants.ListItem.height)
    }
    
    public func collectionView(_:UICollectionView, willDisplay cell:UICollectionViewCell, forItemAt:IndexPath) {
        self.view.bringSubview(toFront:cell)
    }
    
    public func collectionView(_:UICollectionView, didSelectItemAt index:IndexPath) {
        let item:ViewModelItem = self.viewModel.items[index.item]
        self.interactor.stateSelecting(index:index.item, identifier:item.identifier)
        self.view.trackingScroll = false
        self.view.scrollToItem(at:index, at:UICollectionViewScrollPosition.centeredVertically, animated:true)
    }
    
    private func animateSelector() {
        UIView.animate(withDuration:ViewConstants.Selector.animateDuration) { [weak self] in
            self?.view.superview?.layoutIfNeeded()
        }
    }
}
