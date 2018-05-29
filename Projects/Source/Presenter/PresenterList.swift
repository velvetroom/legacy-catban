import UIKit

class PresenterList:NSObject,
UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    var items:[ViewModelListItem]
    var selectedIdentifier:String
    
    override init() {
        self.items = []
        self.selectedIdentifier = String()
        super.init()
    }
    
    func collectionView(
        _ view:UICollectionView, layout:UICollectionViewLayout, insetForSectionAt:Int) -> UIEdgeInsets {
        let viewHeight:CGFloat = view.bounds.height - ViewConstants.ListItem.height
        let margin:CGFloat = viewHeight / 2.0
        return UIEdgeInsets(top:margin, left:0, bottom:margin, right:0)
    }
    
    func collectionView(
        _ view:UICollectionView, layout:UICollectionViewLayout, sizeForItemAt:IndexPath) -> CGSize {
        return CGSize(width:view.bounds.width, height:ViewConstants.ListItem.height)
    }
    
    func collectionView(_:UICollectionView, numberOfItemsInSection:Int) -> Int {
        return self.items.count
    }
    
    func collectionView(_ view:UICollectionView, cellForItemAt index:IndexPath) -> UICollectionViewCell {
        let cell:ViewListCell = view.dequeueReusableCell(
            withReuseIdentifier:ViewConstants.ListItem.identifier, for:index) as! ViewListCell
        self.configure(view:cell, with:self.items[index.item])
        return cell
    }
    
    private func configure(view:ViewListCell, with item:ViewModelListItem) {
        view.labelName.text = item.name
    }
}
