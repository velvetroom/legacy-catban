import UIKit

extension StatsViewCompletion {
    func renderCircleWith(viewModel:CircleViewModel) {
        self.moveToCentre()
        self.context.setFillColor(viewModel.fillColour)
        self.renderArcWith(viewModel:viewModel)
        self.drawFill()
    }
    
    private func renderArcWith(viewModel:CircleViewModel) {
        let radius:CGFloat = self.radius - viewModel.subtractRadius
        self.context.addArc(center:self.centre, radius:radius, startAngle:viewModel.startAngle,
                            endAngle:viewModel.endAngle, clockwise:false)
    }
}
