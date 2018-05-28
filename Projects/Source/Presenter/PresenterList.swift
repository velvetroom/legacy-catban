import UIKit

class PresenterList:NSObject,
UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    var items:[ViewModelListItem]
    
    override init() {
        self.items = []
        super.init()
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
