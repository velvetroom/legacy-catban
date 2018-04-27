import UIKit

class StatsItemCompletion:StatsItemProtocol {
    func factoryViewWith(project:ProjectProtocol) -> UIView {
        let viewModel:CircleCompletionViewModel = CircleCompletionViewModel.factoryWith(project:project)
        let view:StatsViewCompletion = StatsViewCompletion.factoryWith(viewModel:viewModel)
        return view
    }
}
