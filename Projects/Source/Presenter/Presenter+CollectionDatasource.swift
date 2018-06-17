import UIKit

extension Presenter:UICollectionViewDataSource {
    public func collectionView(_:UICollectionView, numberOfItemsInSection:Int) -> Int {
        return self.viewModel.items.count
    }
    
    public func collectionView(_ view:UICollectionView, cellForItemAt index:IndexPath) -> UICollectionViewCell {
        let cell:ViewListCell = view.dequeueReusableCell(withReuseIdentifier:ViewConstants.ListItem.identifier,
                                                         for:index) as! ViewListCell
        let item:ViewModelListItem = self.viewModel.items[index.item]
        self.configure(view:cell, with:item)
        return cell
    }
    
    private func configure(view:ViewListCell, with item:ViewModelListItem) {
        view.labelName.text = item.name
        view.updateState()
    }
}
