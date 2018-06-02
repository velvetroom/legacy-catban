import UIKit

class PresenterList:NSObject,
UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    var items:[ViewModelListItem]
    var selected:ViewModelListItem
    weak var view:ViewList!
    private var shouldUpdateSelected:Bool
    
    private var centerPoint:CGPoint {
        get {
            let halfHeight:CGFloat = self.view.bounds.height / 2.0
            let y:CGFloat = halfHeight + self.view.contentOffset.y
            return CGPoint(x:0, y:y)
        }
    }
    
    private var centerIndexPath:IndexPath? {
        get {
            return self.view.indexPathForItem(at:self.centerPoint)
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
        self.items = []
        self.selected = ViewModelListItem()
        self.shouldUpdateSelected = true
        super.init()
    }
    
    func updateSelector() {
        guard
            let cell:UICollectionViewCell = self.centerCell
        else { return }
        self.view.layoutSelectorY.constant = cell.center.y - self.view.contentOffset.y
    }
    
    func selectCentreCell() {
        guard
            let indexPath:IndexPath = self.centerIndexPath
        else { return }
        self.view.selectItem(
            at:indexPath, animated:true, scrollPosition:UICollectionViewScrollPosition.centeredVertically)
        self.select(indexPath:indexPath)
    }
    
    func scrollViewWillBeginDragging(_:UIScrollView) {
        self.shouldUpdateSelected = true
    }
    
    func scrollViewDidScroll(_:UIScrollView) {
        self.updateSelector()
        if self.shouldUpdateSelected {
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
    
    func collectionView(_:UICollectionView, numberOfItemsInSection:Int) -> Int {
        return self.items.count
    }
    
    func collectionView(_:UICollectionView, cellForItemAt index:IndexPath) -> UICollectionViewCell {
        let cell:ViewListCell = self.view.dequeueReusableCell(
            withReuseIdentifier:ViewConstants.ListItem.identifier, for:index) as! ViewListCell
        self.configure(view:cell, with:self.items[index.item])
        return cell
    }
    
    func collectionView(_:UICollectionView, didSelectItemAt index:IndexPath) {
        self.shouldUpdateSelected = false
        self.view.scrollToItem(at:index, at:UICollectionViewScrollPosition.centeredVertically, animated:true)
        self.select(indexPath:index)
    }
    
    private func configure(view:ViewListCell, with item:ViewModelListItem) {
        view.labelName.text = item.name
        view.updateState()
    }
    
    private func select(indexPath:IndexPath) {
        self.selected = self.items[indexPath.item]
    }
}
