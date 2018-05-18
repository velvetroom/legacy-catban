import Foundation

class PresenterColumnsItem {
    weak var map:MapProtocol!
    weak var viewBoard:ViewContainer!
    var viewModel:ViewModelColumn!
    private let viewColumn:ViewColumn
    private let mapColumn:MapColumn
    
    init() {
        self.viewColumn = ViewColumn()
        self.mapColumn = MapColumn()
        self.mapColumn.view = self.viewColumn
    }
    
    func update() {
        self.configureView()
        self.map.add(column:self.mapColumn)
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
        self.viewColumn.layoutHeight = self.viewColumn.heightAnchor.constraint(
            equalToConstant:ViewConstants.ColumnTitle.height)
        self.viewColumn.layoutWidth = self.viewColumn.widthAnchor.constraint(
            equalToConstant:ViewConstants.Column.width)
        self.viewColumn.layoutTop.isActive = true
        self.viewColumn.layoutLeft.isActive = true
        self.viewColumn.layoutHeight.isActive = true
        self.viewColumn.layoutWidth.isActive = true
    }
    
    private func updateItems() {
        for item:ViewModelProtocol in self.viewModel.items {
            self.add(item:item)
        }
    }
    
    private func add(item:ViewModelProtocol) {
        var updater:PresenterItemProtocol = PresenterFactory.makeFor(viewModel:item)
        updater.viewBoard = self.viewBoard
        updater.column = self.mapColumn
        updater.viewModel = item
        updater.update()
    }
}
