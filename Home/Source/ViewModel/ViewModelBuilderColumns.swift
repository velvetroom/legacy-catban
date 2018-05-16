import UIKit
import Board

class ViewModelBuilderColumns:ViewModelBuilderProtocol {
    var project:ProjectManagedProtocol!
    var viewModel:ViewModel!
    private var itemsBuilder:ViewModelBuilderItems
    
    required init() {
        self.itemsBuilder = ViewModelBuilderItems()
    }
    
    func build() -> ViewModel {
        self.project.iterate { (column:ColumnProtocol) in
            self.buildItems(column:column)
            self.buildFor(column:column)
        }
        return self.viewModel
    }
    
    private func buildFor(column:ColumnProtocol) {
        var viewModel:ViewModelColumn = ViewModelColumn()
        viewModel.name = column.name
        viewModel.items = self.itemsBuilder.items
        self.viewModel.columns.append(viewModel)
    }
    
    private func buildItems(column:ColumnProtocol) {
        self.itemsBuilder.column = column
        self.itemsBuilder.buildCards()
        self.buildNewCard()
    }
    
    private func buildNewCard() {
        if self.viewModel.columns.count == ViewModelConstants.newCardColumnIndex + 1 {
            self.itemsBuilder.buildNewCard()
        }
    }
}
