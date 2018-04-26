import UIKit

extension StatsViewCompletionThirdOrder {
    class func factoryWith(project:ProjectCompletionViewModel) -> StatsViewCompletionThirdOrder {
        let view:StatsViewCompletionThirdOrder = StatsViewCompletionThirdOrder()
        view.viewModel.circles = factoryCirclesWith(project:project)
        return view
    }
    
    private class func factoryCirclesWith(project:ProjectCompletionViewModel) -> [CircleViewModel] {
        var circles:[CircleViewModel] = []
        circles.append(contentsOf:factoryBacklogCircleWith(project:project))
        circles.append(contentsOf:factoryProgressCircleWith(project:project))
        circles.append(contentsOf:factoryDoneCircleWith(project:project))
        circles.append(factoryMiddleCircle())
        circles.append(factoryInnerCircle())
        return circles
    }
    
    private class func factoryBacklogCircleWith(project:ProjectCompletionViewModel) -> [CircleViewModel] {
        let radians:CGFloat = project.backlog.radians - CircleViewModel.Constants.interSpace
        let endAngle:CGFloat = CircleViewModel.Constants.startAngle + radians
        var circleOuter:CircleViewModel = CircleViewModel()
        circleOuter.fillColour = UIColor.Shared.gray.cgColor
        circleOuter.endAngle = endAngle
        circleOuter.subtractRadius = CircleViewModel.Constants.subtractRadiusOuter
        return [
            circleOuter]
    }
    
    private class func factoryProgressCircleWith(project:ProjectCompletionViewModel) -> [CircleViewModel] {
        let startAngle:CGFloat = CircleViewModel.Constants.startAngle + project.backlog.radians
        let radians:CGFloat = project.progress.radians - CircleViewModel.Constants.interSpace
        let endAngle:CGFloat = startAngle + radians
        var circleOuter:CircleViewModel = CircleViewModel()
        circleOuter.fillColour = UIColor.Shared.blue.withAlphaComponent(0.3).cgColor
        circleOuter.startAngle = startAngle
        circleOuter.endAngle = endAngle
        circleOuter.subtractRadius = CircleViewModel.Constants.subtractRadiusOuter
        return [
            circleOuter]
    }
    
    private class func factoryDoneCircleWith(project:ProjectCompletionViewModel) -> [CircleViewModel] {
        let startAngle:CGFloat = CircleViewModel.Constants.startAngle + project.backlog.radians
            + project.progress.radians
        let radians:CGFloat = project.done.radians - CircleViewModel.Constants.interSpace
        let endAngle:CGFloat = startAngle + radians
        var circleOuter:CircleViewModel = CircleViewModel()
        circleOuter.fillColour = UIColor.Shared.blue.cgColor
        circleOuter.startAngle = startAngle
        circleOuter.endAngle = endAngle
        circleOuter.subtractRadius = CircleViewModel.Constants.subtractRadiusOuter
        return [
            circleOuter]
    }
}
