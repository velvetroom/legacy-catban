import UIKit
import Board

class ViewModelBuilderItems {
    var column:ColumnProtocol!
    var left:CGFloat!
    var maxY:CGFloat
    private(set) var items:[ViewModelBoardItemProtocol]
    private let textContent:ViewModelBuilderColumnsTextContent
    
    init() {
        self.items = []
        self.textContent = ViewModelBuilderColumnsTextContent()
        self.maxY = 0
    }
    
    func buildCards() {
        self.maxY = ViewConstants.ColumnTitle.height
        self.column.iterate { (card:CardProtocol) in
            self.add(card:card)
            self.maxY += ViewConstants.Board.cardSpacing
        }
    }
    
    func buildNewCard() {
        var viewModel:ViewModelNewCard = ViewModelNewCard()
        viewModel.left = self.left
        viewModel.width = ViewConstants.Column.width
        viewModel.height = ViewConstants.NewCard.height
        self.add(item:viewModel)
    }
    
    private func add(card:CardProtocol) {
        var viewModel:ViewModelCard = ViewModelCard()
        viewModel.identifier = card.identifier
        viewModel.content = card.content
        viewModel.left = self.left + ViewConstants.Column.paddingHorizontal
        viewModel.width = self.textContent.width
        viewModel.height = self.textContent.heightFor(content:card.content)
        self.add(item:viewModel)
    }
    
    private func add(item:ViewModelBoardItemProtocol) {
        var item:ViewModelBoardItemProtocol = item
        item.top = self.maxY
        self.maxY += item.height
        self.items.append(item)
    }
}
