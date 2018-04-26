import Foundation

extension StatsViewCompletionThirdOrder {
    class func factoryWith(project:ProjectProtocol) -> StatsViewCompletionThirdOrder {
        let view:StatsViewCompletionThirdOrder = StatsViewCompletionThirdOrder()
        view.viewModel.circles = circlesWith(project:project)
        return view
    }
    
    private class func circlesWith(
        project:ProjectProtocol) -> [StatsViewModelCollectionItemCompletionCircle] {
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
