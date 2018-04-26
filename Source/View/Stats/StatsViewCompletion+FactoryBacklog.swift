import UIKit

extension StatsViewCompletion {
    private static var circle:CircleViewModel {
        get {
            var circleOuter:CircleViewModel = CircleViewModel()
            circleOuter.fillColour = UIColor.Shared.gray.cgColor
            circleOuter.subtractRadius = CircleViewModel.Constants.subtractRadiusOuter
            return circleOuter
        }
    }
    
    class func factoryBacklogCircleWith(project:ProjectCompletionViewModel) -> CircleViewModel {
        let radians:CGFloat = project.backlog.radians - CircleViewModel.Constants.interSpace
        var circle:CircleViewModel = self.circle
        circle.endAngle = CircleViewModel.Constants.startAngle + radians
        return circle
    }
}
