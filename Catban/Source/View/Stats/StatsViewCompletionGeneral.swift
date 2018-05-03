import UIKit

class StatsViewCompletionGeneral:UIView {
    weak var labelCardsNumber:UILabel!
    weak var labelCardsTitle:UILabel!
    weak var viewStackBacklog:StatsViewCompletionGeneralStack!
    weak var viewStackProgress:StatsViewCompletionGeneralStack!
    weak var viewStackDone:StatsViewCompletionGeneralStack!
    
    init() {
        super.init(frame:CGRect.zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.isUserInteractionEnabled = false
        self.clipsToBounds = true
        self.factoryOutlets()
        self.factoryStacks()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    func updateWith(viewModel:CircleViewModelCompletion) {
        self.updateOutlets(viewModel:viewModel)
        self.update(stack:self.viewStackBacklog, with:viewModel.backlog)
        self.update(stack:self.viewStackProgress, with:viewModel.progress)
        self.update(stack:self.viewStackDone, with:viewModel.done)
    }
    
    func update(stack:StatsViewCompletionGeneralStack, with viewModel:CircleViewModelCompletionStack) {
        if viewModel.cards > 0 {
            stack.layoutHeight?.constant = Constants.stackHeight
            stack.labelNumber.text = String(viewModel.cards)
        } else {
            stack.layoutHeight?.constant = 0
        }
    }
    
    private func updateOutlets(viewModel:CircleViewModelCompletion) {
        self.labelCardsNumber.text = String(viewModel.totalCards)
    }
}
