import UIKit

class OrganisePresenterCollectionDatasource:NSObject, OrganisePresenterCollectionDatasourceProtocol {
    var viewModel:OrganiseViewModelCollection
    
    override init() {
        self.viewModel = OrganiseViewModelCollection()
    }
    
    func collectionView(_:UICollectionView, numberOfItemsInSection:Int) -> Int {
        return self.viewModel.items.count
    }
    
    func collectionView(_ view:UICollectionView, cellForItemAt index:IndexPath) -> UICollectionViewCell {
        return self.dequeueCellFrom(view:view, index:index)
    }
    
    private func dequeueCellFrom(view:UICollectionView, index:IndexPath) -> OrganiseViewCollectionCell {
        let viewModel:OrganiseViewModelCollectionItem = self.viewModel.items[index.item]
        let cell:OrganiseViewCollectionCell = view.dequeueReusableCell(
            withReuseIdentifier:OrganiseViewCollectionCell.reusableIdentifier,
            for:index) as! OrganiseViewCollectionCell
        self.configure(cell:cell, with:viewModel)
        return cell
    }
    
    private func configure(cell:OrganiseViewCollectionCell, with viewModel:OrganiseViewModelCollectionItem) {
        cell.labelName?.text = viewModel.name
        cell.updateState()
    }
}
