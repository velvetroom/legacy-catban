import UIKit

extension StatsViewCompletion {
    class func factoryWith(project:ProjectProtocol) -> StatsViewCompletion {
        let view:StatsViewCompletion = StatsViewCompletion()
        view.updateWith(project:project)
        return view
    }
}
