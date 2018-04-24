import UIKit
@testable import catban

class MockStatsViewCollection:StatsViewCollection {
    var cell:StatsViewCollectionCell
    
    override init() {
        self.cell = StatsViewCollectionCell(frame:CGRect.zero)
        super.init()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    override func dequeueReusableCell(withReuseIdentifier:String, for:IndexPath) -> UICollectionViewCell {
        return self.cell
    }
}
