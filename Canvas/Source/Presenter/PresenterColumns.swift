import UIKit

class PresenterColumns:PresenterProtocol {
    weak var map:MapProtocol!
    weak var viewBoard:ViewBoard!
    var outlets:PresenterOutlets!
    var viewModel:ViewModel!
    
    required init() { }
    
    func update() {
        guard
            let viewBoard:ViewBoard = self.outlets.viewBoard
        else { return }
        self.viewBoard = viewBoard
        self.outlets.viewBoard?.removeSubviews()
        for column:ViewModelColumn in self.viewModel.columns {
            self.add(column:column)
        }
        self.map.updateContentSize()
    }
    
    private func add(column:ViewModelColumn) {
        let updater:PresenterColumnsItem = PresenterColumnsItem()
        updater.viewModel = column
        updater.map = map
        updater.viewBoard = self.viewBoard
        updater.update()
    }
}
