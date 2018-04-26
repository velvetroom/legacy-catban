import Foundation

extension StatsViewCompletionThirdOrder {
    class func factoryWith(project:ProjectProtocol) -> StatsViewCompletionThirdOrder {
        let view:StatsViewCompletionThirdOrder = StatsViewCompletionThirdOrder()
        view.viewModel.circles = factoryCirclesWith(project:project)
        return view
    }
    
    private class func factoryCirclesWith(
        project:ProjectProtocol) -> [StatsViewModelCollectionItemCompletionCircle] {
        return []
    }
}
