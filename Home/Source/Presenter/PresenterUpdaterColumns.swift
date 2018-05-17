import UIKit

class PresenterUpdaterColumns:PresenterUpdaterProtocol {
    var outlets:PresenterOutlets!
    var viewModel:ViewModel!
    var drag:Map!
    private var viewBoard:ViewBoard!
    
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
    }
    
    private func add(column:ViewModelColumn) {
        let updater:PresenterUpdaterColumnsItem = PresenterUpdaterColumnsItem()
        updater.viewModel = column
        updater.drag = drag
        updater.viewBoard = self.viewBoard
        updater.update()
    }
}
