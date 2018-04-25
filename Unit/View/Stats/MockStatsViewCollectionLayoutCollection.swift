import UIKit
@testable import catban

class MockStatsViewCollectionLayoutCollection:UICollectionView, UICollectionViewDataSource {
    var layout:StatsViewCollectionLayout
    var numberOfItems:Int
    
    init() {
        self.layout = StatsViewCollectionLayout()
        self.numberOfItems = 0
        super.init(frame:CGRect.zero, collectionViewLayout:self.layout)
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    override func numberOfItems(inSection section:Int) -> Int {
        return self.numberOfItems
    }
}
