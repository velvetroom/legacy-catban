import UIKit

class PresenterList:NSObject,
UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    var items:[ViewModelListItem]
    var selectedIdentifier:String
    weak var view:ViewList!
    private var centerPoint:CGPoint {
        get {
            return CGPoint(x:self.view.bounds.width / 2.0, y:self.view.bounds.height / 2.0)
        }
    }
    
    override init() {
        self.items = []
        self.selectedIdentifier = String()
        super.init()
    }
    
    func updateSelector() {
        guard
            let cell:UICollectionViewCell = self.cellAtCenter()
        else { return }
        self.view.layoutSelectorY.constant = cell.center.y - self.view.contentOffset.y
    }
    
    func scrollViewDidScroll(_:UIScrollView) {
        guard
            let cell:UICollectionViewCell = self.cellAtCenter()
        else { return }
        self.view.layoutSelectorY.constant = cell.center.y - self.view.contentOffset.y
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
    
    private func configure(view:ViewListCell, with item:ViewModelListItem) {
        view.labelName.text = item.name
    }
    
    private func cellAtCenter() -> UICollectionViewCell? {
        guard
            let indexPath:IndexPath = self.view.indexPathForItem(at:self.centerPoint)
        else { return nil }
        return self.view.cellForItem(at:indexPath)
    }
}
