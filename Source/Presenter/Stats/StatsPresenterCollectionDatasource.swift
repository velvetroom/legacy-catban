import UIKit

class StatsPresenterCollectionDatasource:NSObject, StatsPresenterCollectionDatasourceProtocol {
    func collectionView(_:UICollectionView, numberOfItemsInSection:Int) -> Int {
        return 0
    }
    
    func collectionView(_ view:UICollectionView, cellForItemAt index:IndexPath) -> UICollectionViewCell {
        return self.dequeueCellIn(view:view, at:index)
    }
    
    private func dequeueCellIn(view:UICollectionView, at index:IndexPath) -> UICollectionViewCell {
        let cell:StatsViewCollectionCell = view.dequeueReusableCell(
            withReuseIdentifier:StatsViewCollectionCell.reusableIdentifier, for:index) as! StatsViewCollectionCell
        return cell
    }
}
