import UIKit
@testable import catban

class MockStatsPresenterCollectionDatasourceProtocol:
NSObject, StatsPresenterCollectionDatasourceProtocol {
    var cell:StatsViewCollectionCell
    var viewModel:StatsViewModelCollection
    
    override init() {
        self.cell = StatsViewCollectionCell(frame:CGRect.zero)
        self.viewModel = StatsViewModelCollection()
        super.init()
    }
    
    func collectionView(_:UICollectionView, numberOfItemsInSection:Int) -> Int {
        return 0
    }
    
    func collectionView(_:UICollectionView, cellForItemAt:IndexPath) -> UICollectionViewCell {
        return self.cell
    }
}
