import UIKit
import Board

class ViewModelBuilderItems {
    var column:ColumnProtocol!
    private(set) var items:[ViewModelBoardItemProtocol]!
    private let textContent:ViewModelBuilderColumnsTextContent
    
    init() {
        self.textContent = ViewModelBuilderColumnsTextContent()
    }
    
    func buildCards() {
        self.items = []
        self.column.iterate { (card:CardProtocol) in
            self.add(card:card)
        }
    }
    
    func buildNewCard() {
        var viewModel:ViewModelNewCard = ViewModelNewCard()
        viewModel.height = ViewConstants.NewCard.height
        self.items.append(viewModel)
    }
    
    private func add(card:CardProtocol) {
        var viewModel:ViewModelCard = ViewModelCard()
        viewModel.identifier = card.identifier
        viewModel.content = card.content
        viewModel.height = self.textContent.heightFor(content:card.content)
        self.items.append(viewModel)
    }
}
