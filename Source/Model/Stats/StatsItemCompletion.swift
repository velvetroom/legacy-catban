import UIKit

class StatsItemCompletion:StatsItemProtocol {
    func factoryViewWith(project:ProjectProtocol) -> UIView {
        let view:StatsViewCompletion = StatsViewCompletion.factoryWith(project:project)
        return view
    }
}
