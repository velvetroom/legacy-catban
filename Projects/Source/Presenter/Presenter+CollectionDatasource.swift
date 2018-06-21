import UIKit

extension Presenter:UICollectionViewDataSource {
    public func collectionView(_:UICollectionView, numberOfItemsInSection:Int) -> Int {
        let viewModel:ViewModelList = self.viewModel.property()
        return viewModel.items.count
    }
    
    public func collectionView(_ view:UICollectionView, cellForItemAt index:IndexPath) -> UICollectionViewCell {
        let cell:ViewListCell = view.dequeueReusableCell(withReuseIdentifier:ViewConstants.ListItem.identifier,
                                                         for:index) as! ViewListCell
        let viewModel:ViewModelList = self.viewModel.property()
        self.configure(view:cell, with:viewModel.items[index.item])
        return cell
    }
    
    private func configure(view:ViewListCell, with item:ViewModelListItem) {
        view.labelName.text = item.name
        view.updateState()
    }
}
