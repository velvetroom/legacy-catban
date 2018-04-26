import UIKit

struct StatsViewModelCollectionItemCompletionCircle {
    var fillColour:CGColor
    var startAngle:CGFloat
    var endAngle:CGFloat
    var sustract:((StatsViewCompletionProtocol) -> () -> (CGFloat))
    
    init() {
        self.fillColour = UIColor.white.cgColor
        self.startAngle = StatsViewCompletionConstants.startAngle
        self.endAngle = StatsViewCompletionConstants.endAngle
        self.radius = StatsViewCompletionProtocol.getInnerCircleRadius
    }
}
