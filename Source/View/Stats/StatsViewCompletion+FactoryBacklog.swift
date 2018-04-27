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
    
    class func factoryBacklogCircleWith(viewModel:CircleCompletionViewModel) -> CircleViewModel {
        let radians:CGFloat = viewModel.backlog.radians - CircleViewModel.Constants.interSpace
        var circle:CircleViewModel = self.circle
        circle.endAngle = CircleViewModel.Constants.startAngle + radians
        return circle
    }
}
