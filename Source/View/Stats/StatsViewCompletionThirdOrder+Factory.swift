import Foundation

extension StatsViewCompletionThirdOrder {
    class func factoryWith(project:ProjectProtocol) -> StatsViewCompletionThirdOrder {
        let circles:[CircleViewModel] = factoryCirclesWith(project:project)
        let view:StatsViewCompletionThirdOrder = StatsViewCompletionThirdOrder()
        view.viewModel.circles.append(contentsOf:circles)
        return view
    }
    
    private class func factoryCirclesWith(project:ProjectProtocol) -> [CircleViewModel] {
//        let backlogCircle:StatsViewModelCollectionItemCompletionCircle = self.backlogCircleWith(project:project)
//        let progressCircle:StatsViewModelCollectionItemCompletionCircle = self.backlogCircleWith(project:project)
//        let doneCircle:StatsViewModelCollectionItemCompletionCircle = self.backlogCircleWith(project:project)
        return []
    }
    
//    private class func backlogCircleWith(
//        project:ProjectProtocol) -> StatsViewModelCollectionItemCompletionCircle {
//        var viewModel:StatsViewModelCollectionItemCompletionCircle =
//            StatsViewModelCollectionItemCompletionCircle()
//        return viewModel
//    }
}
