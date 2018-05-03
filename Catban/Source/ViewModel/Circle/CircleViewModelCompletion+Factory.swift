import UIKit

extension CircleViewModelCompletion {
    static func factoryWith(project:ProjectProtocol) -> CircleViewModelCompletion {
        var viewModel:CircleViewModelCompletion = CircleViewModelCompletion()
        viewModel.totalCards = project.totalCards
        viewModel.backlog = backglog(project:project)
        viewModel.progress = progress(project:project)
        viewModel.done = done(project:project)
        return viewModel
    }
    
    static func stackFor(cards:Int, with totalCards:Int) -> CircleViewModelCompletionStack {
        var viewModel:CircleViewModelCompletionStack = CircleViewModelCompletionStack()
        viewModel.cards = cards
        viewModel.percent = CGFloat(cards)  / CGFloat(totalCards)
        viewModel.radians = CircleViewModel.percentToRadians(percent:viewModel.percent)
        return viewModel
    }
    
    private static func backglog(project:ProjectProtocol) -> CircleViewModelCompletionStack {
        if let column:ProjectColumn = project.columns.first {
            return stackFor(cards:column.cards.count, with:project.totalCards)
        }
        return CircleViewModelCompletionStack()
    }
    
    private static func progress(project:ProjectProtocol) -> CircleViewModelCompletionStack {
        var cards:Int = 0
        let countColumns:Int = project.columns.count
        if countColumns > 2 {
            for index:Int in 1 ..< countColumns - 1 {
                cards += project.columns[index].cards.count
            }
            return stackFor(cards:cards, with:project.totalCards)
        }
        return CircleViewModelCompletionStack()
    }
    
    private static func done(project:ProjectProtocol) -> CircleViewModelCompletionStack {
        if project.columns.count > 1 {
            if let column:ProjectColumn = project.columns.last {
                return stackFor(cards:column.cards.count, with:project.totalCards)
            }
        }
        return CircleViewModelCompletionStack()
    }
}
