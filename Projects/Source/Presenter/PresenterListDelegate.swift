import UIKit

class PresenterListDelegate:NSObject, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    weak var view:ViewList!
    var selected:IndexPath
    private var trackingScroll:Bool
    
    var centerIndexPath:IndexPath? {
        get {
            return self.view.indexPathForItem(at:self.centerPoint)
        }
    }
    
    private var centerPoint:CGPoint {
        get {
            let halfHeight:CGFloat = self.view.bounds.height / 2.0
            let y:CGFloat = halfHeight + self.view.contentOffset.y
            return CGPoint(x:0, y:y)
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
    
    override init() {
        self.trackingScroll = true
        self.selected = IndexPath(item:0, section:0)
        super.init()
    }
    
    func updateSelector() {
        var centreY:CGFloat
        if let cell:UICollectionViewCell = self.centerCell {
            centreY = cell.center.y
        } else {
            centreY = self.view.bounds.midY
        }
        self.view.layoutSelectorY.constant = centreY - self.view.contentOffset.y
    }
    
    func selectCentreCell() {
        guard
            let indexPath:IndexPath = self.centerIndexPath
        else { return }
        self.selected = indexPath
        self.view.selectItem(at:indexPath, animated:false, scrollPosition:UICollectionViewScrollPosition())
    }
    
    func scrollViewWillBeginDragging(_:UIScrollView) {
        self.trackingScroll = true
    }
    
    func scrollViewDidScroll(_:UIScrollView) {
        self.updateSelector()
        if self.trackingScroll {
            self.selectCentreCell()
        }
    }
    
    func collectionView(_:UICollectionView, layout:UICollectionViewLayout, insetForSectionAt:Int) -> UIEdgeInsets {
        let viewHeight:CGFloat = self.view.bounds.height - ViewConstants.ListItem.height
        let margin:CGFloat = viewHeight / 2.0
        return UIEdgeInsets(top:margin, left:0, bottom:margin, right:0)
    }
    
    func collectionView(_:UICollectionView, layout:UICollectionViewLayout, sizeForItemAt:IndexPath) -> CGSize {
        return CGSize(width:self.view.bounds.width, height:ViewConstants.ListItem.height)
    }
    
    func collectionView(_:UICollectionView, didSelectItemAt index:IndexPath) {
        self.selected = index
        self.trackingScroll = false
        self.view.scrollToItem(at:index, at:UICollectionViewScrollPosition.centeredVertically, animated:true)
    }
}
