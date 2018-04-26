import UIKit

struct StatsViewModelCollectionItemCompletionCircle {
    var fillColour:CGColor
    var startAngle:CGFloat
    var endAngle:CGFloat
    var radius:((UIView) -> () -> (CGFloat))?
    
    init() {
        self.fillColour = UIColor.white.cgColor
        self.startAngle = 0
        self.endAngle = 0
    }
}
