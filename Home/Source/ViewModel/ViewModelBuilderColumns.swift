import UIKit
import Board

class ViewModelBuilderColumns:ViewModelBuilderProtocol {
    var project:ProjectManagedProtocol!
    var viewModel:ViewModel!
    private var items:ViewModelBuilderItems
    private var left:CGFloat
    
    required init() {
        self.items = ViewModelBuilderItems()
        self.left = ViewConstants.Board.paddingHorizontal
    }
    
    func build() -> ViewModel {
        self.project.iterate { (column:ColumnProtocol) in
            self.buildFor(column:column)
            self.left += ViewConstants.Column.width + ViewConstants.Board.columnSpacing
        }
        return self.viewModel
    }
    
    private func buildFor(column:ColumnProtocol) {
        self.add(column:column)
        self.buildItems(column:column)
    }
    
    private func add(column:ColumnProtocol) {
        var viewModel:ViewModelColumn = ViewModelColumn()
        viewModel.name = column.name
        viewModel.left = self.left
        self.viewModel.columns.append(viewModel)
    }
    
    private func buildItems(column:ColumnProtocol) {
        self.items.left = self.left
        self.items.column = column
        self.items.buildCards()
        self.buildNewCard()
        self.viewModel.items.append(contentsOf:self.items.items)
        self.updateMaxY()
    }
    
    private func buildNewCard() {
        if self.viewModel.columns.count == ViewModelConstants.newCardColumnIndex + 1 {
            self.items.buildNewCard()
        }
    }
    
    private func updateMaxY() {
        if self.items.maxY > self.viewModel.board.maxColumnY {
            self.viewModel.board.maxColumnY = self.items.maxY
        }
    }
}
