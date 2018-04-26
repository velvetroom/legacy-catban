import UIKit

extension StatsViewCompletionThirdOrder {
    class func factoryWith(project:ProjectCompletionViewModel) -> StatsViewCompletionThirdOrder {
        let view:StatsViewCompletionThirdOrder = StatsViewCompletionThirdOrder()
        view.viewModel.circles = factoryCirclesWith(project:project)
        return view
    }
    
    private class func factoryCirclesWith(project:ProjectCompletionViewModel) -> [CircleViewModel] {
        var circles:[CircleViewModel] = factoryWithBacklogFor(project:project)
        circles = factoryWithProgressFor(project:project, and:circles)
        circles = factoryWithDoneFor(project:project, and:circles)
        circles.append(factoryMiddleCircle())
        circles.append(factoryInnerCircle())
        return circles
    }
    
    private class func factoryWithBacklogFor(project:ProjectCompletionViewModel) -> [CircleViewModel] {
        var circles:[CircleViewModel] = []
        if project.backlog.cards > 0 {
            circles.append(factoryBacklogCircleWith(project:project))
        }
        return circles
    }
    
    private class func factoryWithProgressFor(project:ProjectCompletionViewModel,
                                              and circles:[CircleViewModel]) -> [CircleViewModel] {
        var circles:[CircleViewModel] = circles
        if project.progress.cards > 0 {
            circles.append(factoryProgressCircleWith(project:project))
        }
        return circles
    }
    
    private class func factoryWithDoneFor(project:ProjectCompletionViewModel,
                                              and circles:[CircleViewModel]) -> [CircleViewModel] {
        var circles:[CircleViewModel] = circles
        if project.done.cards > 0 {
            circles.append(factoryDoneCircleWith(project:project))
        }
        return circles
    }
}
