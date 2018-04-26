import UIKit

extension StatsViewCompletion {
    private static var circle:CircleViewModel {
        get {
            var circleOuter:CircleViewModel = CircleViewModel()
            circleOuter.fillColour = UIColor.Shared.blue.cgColor
            circleOuter.subtractRadius = CircleViewModel.Constants.subtractRadiusOuter
            return circleOuter
        }
    }
    
    class func factoryDoneCircleWith(project:ProjectCompletionViewModel) -> CircleViewModel {
        let radians:CGFloat = project.done.radians - CircleViewModel.Constants.interSpace
        var circle:CircleViewModel = self.circle
        circle.startAngle = CircleViewModel.Constants.startAngle + project.backlog.radians
            + project.progress.radians
        circle.endAngle = circle.startAngle + radians
        return circle
    }
}
