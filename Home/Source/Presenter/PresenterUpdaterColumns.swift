import Foundation

class PresenterUpdaterColumns:PresenterUpdaterProtocol {
    var outlets:PresenterOutlets!
    var viewModel:ViewModel!
    var controller:Controller!
    var drag:Drag!
    
    required init() { }
    
    func update() {
        guard
            let viewBoard:ViewBoard = self.outlets.viewBoard
        else { return }
        self.removePreviousColumnsFrom(viewBoard:viewBoard)
        for column:ViewModelColumn in self.viewModel.columns {
            self.addColumnWith(viewModel:column, to:viewBoard)
        }
    }
    
    private func removePreviousColumnsFrom(viewBoard:ViewBoard) {
        for column:ViewColumn in viewBoard.columns {
            column.removeFromSuperview()
        }
        viewBoard.columns = []
    }
    
    private func addColumnWith(viewModel:ViewModelColumn, to viewBoard:ViewBoard) {
        let view:ViewColumn = ViewColumn()
        self.addDragging(view:view)
        self.addColumn(view:view, to:viewBoard)
        view.layoutLeft.constant = viewModel.left
        view.labelName.text = viewModel.name
    }
    
    private func addDragging(view:ViewColumn) {
        var column:DragColumn = DragColumn()
        column.view = view
        self.drag.columns.append(column)
    }
    
    private func addColumn(view:ViewColumn, to viewBoard:ViewBoard) {
        viewBoard.addSubview(view)
        viewBoard.columns.append(view)
        
        view.topAnchor.constraint(equalTo:viewBoard.topAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo:viewBoard.bottomAnchor).isActive = true
        view.widthAnchor.constraint(equalToConstant:ViewConstants.Column.width).isActive = true
        view.layoutLeft = view.leftAnchor.constraint(equalTo:viewBoard.leftAnchor)
        view.layoutLeft.isActive = true
    }
}
