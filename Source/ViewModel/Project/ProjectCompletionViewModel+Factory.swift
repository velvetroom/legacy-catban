import UIKit

extension ProjectCompletionViewModel {
    static func factoryWith(project:ProjectProtocol) -> ProjectCompletionViewModel {
        var viewModel:ProjectCompletionViewModel = ProjectCompletionViewModel()
        viewModel.totalCards = project.totalCards
        viewModel.backlog = backglog(project:project)
        viewModel.progress = progress(project:project)
        viewModel.done = done(project:project)
        return viewModel
    }
    
    private static func backglog(project:ProjectProtocol) -> ProjectCompletionViewModelStack {
        if let column:ProjectColumn = project.columns.first {
            return stackFor(cards:column.cards.count, with:project.totalCards)
        }
        return ProjectCompletionViewModelStack()
    }
    
    private static func progress(project:ProjectProtocol) -> ProjectCompletionViewModelStack {
        var cards:Int = 0
        let countColumns:Int = project.columns.count
        if countColumns > 2 {
            for index:Int in 1 ..< countColumns - 1 {
                cards = project.columns[index].cards.count
            }
            return stackFor(cards:cards, with:project.totalCards)
        }
        return ProjectCompletionViewModelStack()
    }
    
    private static func done(project:ProjectProtocol) -> ProjectCompletionViewModelStack {
        if let column:ProjectColumn = project.columns.last {
            return stackFor(cards:column.cards.count, with:project.totalCards)
        }
        return ProjectCompletionViewModelStack()
    }
    
    private static func stackFor(cards:Int, with totalCards:Int) -> ProjectCompletionViewModelStack {
        var viewModel:ProjectCompletionViewModelStack = ProjectCompletionViewModelStack()
        viewModel.cards = cards
        viewModel.percent = CGFloat(cards)  / CGFloat(totalCards)
        viewModel.radians = CircleViewModel.percentToRadians(percent:viewModel.percent)
        return viewModel
    }
}
