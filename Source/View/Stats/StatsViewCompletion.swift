import UIKit

class StatsViewCompletion:StatsView<StatsViewModelCollectionItemCompletion> {
    weak var viewGeneral:StatsViewCompletionGeneral!
    var radius:CGFloat
    
    override init() {
        self.radius = 0
        super.init()
        self.factoryOutlets()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    func updateWith(project:ProjectProtocol) {
        let viewModel:CircleCompletionViewModel = CircleCompletionViewModel.factoryWith(project:project)
        self.viewModel.circles = CircleViewModel.factoryWith(viewModel:viewModel)
        self.viewGeneral.updateWith(viewModel:viewModel)
    }
    
    override func render() {
        for circle:CircleViewModel in self.viewModel.circles {
            self.renderCircleWith(viewModel:circle)
        }
    }
    
    override func draw(_ rect:CGRect) {
        let minSize:CGFloat = min(rect.width, rect.height)
        self.radius = minSize / 2.0
        super.draw(rect)
    }
}
