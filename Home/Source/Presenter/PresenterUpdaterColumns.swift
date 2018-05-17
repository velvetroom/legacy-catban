import UIKit

class PresenterUpdaterColumns:PresenterUpdaterProtocol {
    weak var map:MapProtocol!
    var outlets:PresenterOutlets!
    var viewModel:ViewModel!
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
        self.map.updateContentSize()
    }
    
    private func add(column:ViewModelColumn) {
        let updater:PresenterUpdaterColumnsItem = PresenterUpdaterColumnsItem()
        updater.viewModel = column
        updater.map = map
        updater.viewBoard = self.viewBoard
        updater.update()
    }
}
