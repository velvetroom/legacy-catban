import UIKit

class StatsItemCompletion:StatsItemProtocol {
    func factoryViewWith(project:ProjectProtocol) -> UIView {
        let viewModel:CircleCompletionViewModel = CircleCompletionViewModel.factoryWith(project:project)
        let countColumns:Int = project.columns.count
        if countColumns >= Constants.thirdOrder {
            return StatsViewCompletionThirdOrder.factoryWith(project:viewModel)
        } else if countColumns >= Constants.secondOrder {
            return self.factorySecondOrderWith(project:project)
        } else {
            return self.factoryFirstOrderWith(project:project)
        }
    }
    
    private func factoryFirstOrderWith(project:ProjectProtocol) -> UIView {
        return StatsViewCompletionFirstOrder()
    }
    
    private func factorySecondOrderWith(project:ProjectProtocol) -> UIView {
        return StatsViewCompletionSecondOrder()
    }
}
