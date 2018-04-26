import UIKit

class StatsViewCompletionThirdOrder:StatsViewCompletion<StatsViewModelCollectionItemCompletionThirdOrder> {
    override func render() {
        self.context.move(to:self.centre)
        self.context.setFillColor(UIColor.Shared.gray.cgColor)
        self.context.addArc(center:self.centre, radius:self.outerCircleRadius,
                            startAngle:StatsViewCompletionConstants.startAngle,
                            endAngle:StatsViewCompletionConstants.endAngle, clockwise:false)
        self.context.drawPath(using:CGPathDrawingMode.fill)
        
        self.context.setFillColor(UIColor.Shared.blue.withAlphaComponent(0.3).cgColor)
        self.context.addArc(center:self.centre, radius:self.middleCircleRadius,
                            startAngle:StatsViewCompletionConstants.startAngle,
                            endAngle:StatsViewCompletionConstants.endAngle, clockwise:false)
        self.context.drawPath(using:CGPathDrawingMode.fill)
        
        self.context.setFillColor(UIColor.white.cgColor)
        self.context.addArc(center:self.centre, radius:self.innerCircleRadius,
                            startAngle:StatsViewCompletionConstants.startAngle,
                            endAngle:StatsViewCompletionConstants.endAngle, clockwise:false)
        self.context.drawPath(using:CGPathDrawingMode.fill)
    }
}
