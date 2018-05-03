import UIKit
@testable import catban

class MockStatsViewCollectionLayoutCollection:UICollectionView, UICollectionViewDataSource {
    var layout:StatsViewCollectionLayout
    var cell:UICollectionViewCell
    var numberOfItems:Int
    
    init() {
        self.layout = StatsViewCollectionLayout()
        self.cell = UICollectionViewCell(frame:CGRect.zero)
        self.numberOfItems = 0
        super.init(frame:CGRect.zero, collectionViewLayout:self.layout)
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    func collectionView(_:UICollectionView, numberOfItemsInSection:Int) -> Int {
        return self.numberOfItems
    }
    
    func collectionView(_:UICollectionView, cellForItemAt:IndexPath) -> UICollectionViewCell {
        return self.cell
    }
    
    override func numberOfItems(inSection section:Int) -> Int {
        return self.numberOfItems
    }
}
