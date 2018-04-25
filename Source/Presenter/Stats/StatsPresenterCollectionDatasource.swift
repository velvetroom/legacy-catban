import UIKit

class StatsPresenterCollectionDatasource:NSObject, StatsPresenterCollectionDatasourceProtocol {
    var viewModel:StatsViewModelCollection
    
    override init() {
        self.viewModel = StatsViewModelCollection()
        super.init()
    }
    
    func collectionView(_:UICollectionView, numberOfItemsInSection:Int) -> Int {
        return self.viewModel.items.count
    }
    
    func collectionView(_ view:UICollectionView, cellForItemAt index:IndexPath) -> UICollectionViewCell {
        return self.dequeueCellIn(view:view, at:index)
    }
    
    private func dequeueCellIn(view:UICollectionView, at index:IndexPath) -> UICollectionViewCell {
        let cell:StatsViewCollectionCell = view.dequeueReusableCell(
            withReuseIdentifier:StatsViewCollectionCell.reusableIdentifier, for:index) as! StatsViewCollectionCell
        let viewModel:StatsViewModelCollectionItemProtocol = self.viewModel.items[index.item]
        self.configure(cell:cell, with:viewModel)
        return cell
    }
    
    private func configure(cell:StatsViewCollectionCell,
                           with viewModel:StatsViewModelCollectionItemProtocol) {
        
    }
}
