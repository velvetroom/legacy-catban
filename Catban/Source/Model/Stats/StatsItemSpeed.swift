import UIKit

class StatsItemSpeed:StatsItemProtocol {
    func factoryViewWith(project:ProjectProtocol) -> UIView {
        return StatsViewSpeed()
    }
}
