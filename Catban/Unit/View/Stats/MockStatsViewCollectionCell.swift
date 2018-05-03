import UIKit
@testable import catban

class MockStatsViewCollectionCell:StatsViewCollectionCell {
    var onUpdateWithView:((UIView) -> Void)?
    
    override func updateWith(view:UIView) {
        self.onUpdateWithView?(view)
        super.updateWith(view:view)
    }
}
