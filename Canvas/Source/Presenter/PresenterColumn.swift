import Foundation
import Board

class PresenterColumn:PresenterColumnProtocol {
    weak var view:View!
    weak var column:ColumnProtocol!
    var viewColumn:ViewColumn
    var mapColumn:MapColumnProtocol
    
    required init() {
        self.viewColumn = ViewColumn()
        self.mapColumn = MapColumn()
        self.mapColumn.view = self.viewColumn
        self.viewColumn.mapNode = self.mapColumn
    }
    
    func load() {
        self.configureItem()
        self.configureView()
        self.loadItems()
    }
    
    func loadNewCard() {
        self.loadWith(loader:PresenterFactory.makeNewCardLoader())
    }
    
    private func configureItem() {
        self.mapColumn.identifier = self.column.identifier
    }
    
    private func configureView() {
        self.viewColumn.identifier = self.column.identifier
        self.viewColumn.labelName.text = self.column.name
        self.view.addSubview(self.viewColumn)
        self.configureConstraints()
        self.activateConstraints()
    }
    
    private func configureConstraints() {
        self.viewColumn.layoutTop = self.viewColumn.topAnchor.constraint(equalTo:self.view.topAnchor)
        self.viewColumn.layoutLeft = self.viewColumn.leftAnchor.constraint(equalTo:self.view.leftAnchor)
        self.viewColumn.layoutHeight = self.viewColumn.heightAnchor.constraint(
            equalToConstant:Constants.ColumnTitle.height)
        self.viewColumn.layoutWidth = self.viewColumn.widthAnchor.constraint(
            equalToConstant:Constants.Column.width)
    }
    
    private func activateConstraints() {
        self.viewColumn.layoutTop.isActive = true
        self.viewColumn.layoutLeft.isActive = true
        self.viewColumn.layoutHeight.isActive = true
        self.viewColumn.layoutWidth.isActive = true
    }
    
    private func loadItems() {
        self.column.iterate { (card:CardProtocol) in
            var loader:PresenterCardProtocol = PresenterFactory.makeCardLoader()
            loader.card = card
            self.loadWith(loader:loader)
        }
    }
    
    private func loadWith(loader:PresenterItemProtocol) {
        var loader:PresenterItemProtocol = loader
        loader.mapColumn = self.mapColumn
        loader.view = self.view
        loader.load()
    }
}
