import Foundation

class StatsItemSpeed:StatsItemProtocol {
    func factoryViewWith(project:ProjectProtocol) -> StatsView {
        return StatsViewSpeed()
    }
}
