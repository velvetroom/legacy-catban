import UIKit

extension CircleCompletionViewModel {
    static func factoryWith(project:ProjectProtocol) -> CircleCompletionViewModel {
        var viewModel:CircleCompletionViewModel = CircleCompletionViewModel()
        viewModel.totalCards = project.totalCards
        viewModel.backlog = backglog(project:project)
        viewModel.progress = progress(project:project)
        viewModel.done = done(project:project)
        return viewModel
    }
    
    private static func backglog(project:ProjectProtocol) -> CircleCompletionStackViewModel {
        if let column:ProjectColumn = project.columns.first {
            return stackFor(cards:column.cards.count, with:project.totalCards)
        }
        return CircleCompletionStackViewModel()
    }
    
    private static func progress(project:ProjectProtocol) -> CircleCompletionStackViewModel {
        var cards:Int = 0
        let countColumns:Int = project.columns.count
        if countColumns > 2 {
            for index:Int in 1 ..< countColumns - 1 {
                cards = project.columns[index].cards.count
            }
            return stackFor(cards:cards, with:project.totalCards)
        }
        return CircleCompletionStackViewModel()
    }
    
    private static func done(project:ProjectProtocol) -> CircleCompletionStackViewModel {
        if let column:ProjectColumn = project.columns.last {
            return stackFor(cards:column.cards.count, with:project.totalCards)
        }
        return CircleCompletionStackViewModel()
    }
    
    private static func stackFor(cards:Int, with totalCards:Int) -> CircleCompletionStackViewModel {
        var viewModel:CircleCompletionStackViewModel = CircleCompletionStackViewModel()
        viewModel.cards = cards
        viewModel.percent = CGFloat(cards)  / CGFloat(totalCards)
        viewModel.radians = CircleViewModel.percentToRadians(percent:viewModel.percent)
        return viewModel
    }
}
