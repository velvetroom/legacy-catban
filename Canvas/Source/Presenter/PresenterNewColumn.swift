import Foundation

class PresenterNewColumn:PresenterNewColumnProtocol {
    weak var view:View!
    var viewNewColumn:ViewNewColumn
    var mapColumn:MapColumnProtocol
    
    required init() {
        self.viewNewColumn = ViewNewColumn()
        self.mapColumn = MapNewColumn()
        self.mapColumn.view = self.viewNewColumn
        self.viewNewColumn.mapNode = self.mapColumn
    }
    
    func load() {
        self.configureView()
    }
    
    private func configureView() {
        self.view.addSubview(self.viewNewColumn)
        self.configureConstraints()
        self.activateConstraints()
    }
    
    private func configureConstraints() {
        self.viewNewColumn.layoutTop = self.viewNewColumn.topAnchor.constraint(equalTo:self.view.topAnchor)
        self.viewNewColumn.layoutLeft = self.viewNewColumn.leftAnchor.constraint(equalTo:self.view.leftAnchor)
        self.viewNewColumn.layoutHeight = self.viewNewColumn.heightAnchor.constraint(
            equalToConstant:Constants.ColumnTitle.height)
        self.viewNewColumn.layoutWidth = self.viewNewColumn.widthAnchor.constraint(
            equalToConstant:Constants.Column.width)
    }
    
    private func activateConstraints() {
        self.viewNewColumn.layoutTop.isActive = true
        self.viewNewColumn.layoutLeft.isActive = true
        self.viewNewColumn.layoutHeight.isActive = true
        self.viewNewColumn.layoutWidth.isActive = true
    }
}
