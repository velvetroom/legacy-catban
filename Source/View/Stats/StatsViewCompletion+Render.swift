import UIKit

extension StatsViewCompletion {
    func renderCircleWith(viewModel:StatsViewModelCollectionItemCompletionCircle) {
        self.context.setFillColor(viewModel.fillColour)
        self.renderArcWith(viewModel:viewModel)
        self.drawFill()
    }
    
    private func renderArcWith(viewModel:StatsViewModelCollectionItemCompletionCircle) {
//        let radius:CGFloat = viewModel.radius(self)()
//        self.context.addArc(center:self.centre, radius:radius, startAngle:viewModel.startAngle,
//                            endAngle:viewModel.endAngle, clockwise:false)
    }
}
