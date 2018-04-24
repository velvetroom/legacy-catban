import UIKit

class StatsPresenterCollection:NSObject, UICollectionViewDataSource {
    func collectionView(_:UICollectionView, numberOfItemsInSection:Int) -> Int {
        return 0
    }
    
    func collectionView(_ view:UICollectionView, cellForItemAt index:IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}
