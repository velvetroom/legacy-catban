import UIKit

struct CircleViewModel {
    var fillColour:CGColor
    var startAngle:CGFloat
    var endAngle:CGFloat
    var subtractRadius:CGFloat
    
    init() {
        self.fillColour = UIColor.white.cgColor
        self.startAngle = CircleViewModel.Constants.startAngle
        self.endAngle = CircleViewModel.Constants.endAngle
        self.subtractRadius = CircleViewModel.Constants.subtractRadiusInner
    }
}
