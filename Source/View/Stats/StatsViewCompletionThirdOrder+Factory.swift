import UIKit

extension StatsViewCompletionThirdOrder {
    class func factoryWith(project:CircleCompletionViewModel) -> StatsViewCompletionThirdOrder {
        let view:StatsViewCompletionThirdOrder = StatsViewCompletionThirdOrder()
        view.viewGeneral.updateWith(viewModel:project)
        view.viewModel.circles = factoryCirclesWith(project:project)
        return view
    }
    
    private class func factoryCirclesWith(project:CircleCompletionViewModel) -> [CircleViewModel] {
        var circles:[CircleViewModel] = factoryWithBacklogFor(project:project)
        circles = factoryWithProgressFor(project:project, and:circles)
        circles = factoryWithDoneFor(project:project, and:circles)
        circles.append(factoryMiddleCircle())
        circles.append(factoryInnerCircle())
        return circles
    }
    
    private class func factoryWithBacklogFor(project:CircleCompletionViewModel) -> [CircleViewModel] {
        var circles:[CircleViewModel] = []
        if project.backlog.cards > 0 {
            circles.append(factoryBacklogCircleWith(project:project))
        }
        return circles
    }
    
    private class func factoryWithProgressFor(project:CircleCompletionViewModel,
                                              and circles:[CircleViewModel]) -> [CircleViewModel] {
        var circles:[CircleViewModel] = circles
        if project.progress.cards > 0 {
            circles.append(factoryProgressCircleWith(project:project))
        }
        return circles
    }
    
    private class func factoryWithDoneFor(project:CircleCompletionViewModel,
                                              and circles:[CircleViewModel]) -> [CircleViewModel] {
        var circles:[CircleViewModel] = circles
        if project.done.cards > 0 {
            circles.append(factoryDoneCircleWith(project:project))
        }
        return circles
    }
}
