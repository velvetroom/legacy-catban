import UIKit
import Board

class ViewModelBuilderColumns:ViewModelBuilderProtocol {
    var project:ProjectManagedProtocol!
    var viewModel:ViewModel!
    private let textContent:ViewModelBuilderColumnsTextContent
    
    required init() {
        self.textContent = ViewModelBuilderColumnsTextContent()
    }
    
    func build() -> ViewModel {
        var left:CGFloat = ViewConstants.Board.paddingHorizontal
        self.project.iterate { (column:ColumnProtocol) in
            self.add(column:column, at:left)
            self.buildCardsFor(column:column, at:left)
            left += ViewConstants.Column.width + ViewConstants.Board.columnSpacing
        }
        return self.viewModel
    }
    
    private func add(column:ColumnProtocol, at left:CGFloat) {
        var viewModel:ViewModelColumn = ViewModelColumn()
        viewModel.name = column.name
        viewModel.left = left
        self.viewModel.columns.append(viewModel)
    }
    
    private func buildCardsFor(column:ColumnProtocol, at left:CGFloat) {
        let left:CGFloat = left + ViewConstants.Column.paddingHorizontal
        var top:CGFloat = ViewConstants.ColumnTitle.height
        column.iterate { (card:CardProtocol) in
            self.add(card:card, at:left, and:top)
            if let lastCard:ViewModelCard = self.viewModel.cards.last {
                top += lastCard.height
            }
            top += ViewConstants.Board.cardSpacing
        }
    }
    
    private func add(card:CardProtocol, at left:CGFloat, and top:CGFloat) {
        var viewModel:ViewModelCard = ViewModelCard()
        viewModel.identifier = card.identifier
        viewModel.content = card.content
        viewModel.left = left
        viewModel.top = top
        viewModel.width = self.textContent.width
        viewModel.height = self.textContent.heightFor(content:card.content)
        self.viewModel.cards.append(viewModel)
    }
}
