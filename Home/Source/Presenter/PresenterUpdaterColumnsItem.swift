import Foundation

class PresenterUpdaterColumnsItem {
    var viewBoard:ViewBoard!
    var viewModel:ViewModelColumn!
    var drag:Drag!
    private let viewColumn:ViewColumn
    private let dragColumn:DragColumn
    
    init() {
        self.viewColumn = ViewColumn()
        self.dragColumn = DragColumn()
        self.dragColumn.view = self.viewColumn
    }
    
    func update() {
        self.configureView()
        self.drag.add(column:self.dragColumn)
        self.updateItems()
    }
    
    private func configureView() {
        self.viewColumn.labelName.text = self.viewModel.name
        self.viewBoard.addSubview(self.viewColumn)
        self.configureConstraints()
    }
    
    private func configureConstraints() {
        self.viewColumn.layoutTop = self.viewColumn.topAnchor.constraint(equalTo:self.viewBoard.topAnchor)
        self.viewColumn.layoutLeft = self.viewColumn.leftAnchor.constraint(equalTo:self.viewBoard.leftAnchor)
        self.viewColumn.bottomAnchor.constraint(equalTo:self.viewBoard.bottomAnchor).isActive = true
        self.viewColumn.widthAnchor.constraint(equalToConstant:ViewConstants.Column.width).isActive = true
        self.viewColumn.layoutTop.isActive = true
        self.viewColumn.layoutLeft.isActive = true
    }
    
    private func updateItems() {
        for item:ViewModelBoardItemProtocol in self.viewModel.items {
            self.add(item:item)
        }
    }
    
    private func add(item:ViewModelBoardItemProtocol) {
        let updater:PresenterUpdaterColumnsItemChild = PresenterUpdaterColumnsItemChild()
        updater.viewBoard = self.viewBoard
        updater.column = self.dragColumn
        updater.viewModel = item
        updater.update()
    }
}
