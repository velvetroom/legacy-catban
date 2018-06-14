import UIKit

extension Presenter:UICollectionViewDataSource {
    public func collectionView(_:UICollectionView, numberOfItemsInSection:Int) -> Int {
        return self.viewModel.items.count
    }
    
    public func collectionView(_ view:UICollectionView, cellForItemAt index:IndexPath) -> UICollectionViewCell {
        let cell:ViewListCell = view.dequeueReusableCell(
            withReuseIdentifier:ViewConstants.ListItem.identifier, for:index) as! ViewListCell
        self.configure(view:cell, with:self.viewModel.items[index.item])
        return cell
    }
    
    private func configure(view:ViewListCell, with item:ViewModelItem) {
        view.labelName.text = item.name
        view.updateState()
    }
}
