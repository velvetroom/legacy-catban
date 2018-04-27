import UIKit

extension StatsViewCompletion {
    private static var circle:CircleViewModel {
        get {
            var circleOuter:CircleViewModel = CircleViewModel()
            circleOuter.fillColour = UIColor.Shared.blue.withAlphaComponent(0.3).cgColor
            circleOuter.subtractRadius = CircleViewModel.Constants.subtractRadiusOuter
            return circleOuter
        }
    }
    
    class func factoryProgressCircleWith(project:CircleCompletionViewModel) -> CircleViewModel {
        let radians:CGFloat = project.progress.radians - CircleViewModel.Constants.interSpace
        var circle:CircleViewModel = self.circle
        circle.startAngle = CircleViewModel.Constants.startAngle + project.backlog.radians
        circle.endAngle = circle.startAngle + radians
        return circle
    }
}
