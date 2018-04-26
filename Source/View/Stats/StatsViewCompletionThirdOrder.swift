import UIKit

class StatsViewCompletionThirdOrder:StatsViewCompletion {
    override func render() {
        self.context.move(to:self.centre)
        self.context.setFillColor(UIColor.Shared.gray.cgColor)
        self.context.addArc(center:self.centre, radius:self.outerCircleRadius, startAngle:Constants.startAngle,
                            endAngle:Constants.startAngle + Constants.circleRadians, clockwise:false)
        self.context.drawPath(using:CGPathDrawingMode.fill)
        
        self.context.setFillColor(UIColor.Shared.blue.withAlphaComponent(0.3).cgColor)
        self.context.addArc(center:self.centre, radius:self.middleCircleRadius, startAngle:Constants.startAngle,
                            endAngle:Constants.startAngle + Constants.circleRadians, clockwise:false)
        self.context.drawPath(using:CGPathDrawingMode.fill)
        
        self.context.setFillColor(UIColor.white.cgColor)
        self.context.addArc(center:self.centre, radius:self.innerCircleRadius, startAngle:Constants.startAngle,
                            endAngle:Constants.startAngle + Constants.circleRadians, clockwise:false)
        self.context.drawPath(using:CGPathDrawingMode.fill)
    }
}
