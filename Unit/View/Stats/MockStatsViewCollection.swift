import UIKit
@testable import catban

class MockStatsViewCollection:StatsViewCollection {
    var cell:MockStatsViewCollectionCell
    
    override init() {
        self.cell = MockStatsViewCollectionCell(frame:CGRect.zero)
        super.init()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    override func dequeueReusableCell(withReuseIdentifier:String, for:IndexPath) -> UICollectionViewCell {
        return self.cell
    }
}
