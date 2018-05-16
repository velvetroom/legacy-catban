import Foundation

class PresenterUpdaterColumnsItemChild {
    var viewBoard:ViewBoard!
    var viewModel:ViewModelBoardItemProtocol!
    var column:DragColumn!
    private var updaterMap:[ObjectIdentifier:PresenterUpdaterBoardItemProtocol.Type]
    
    init() {
        let identifierCard:ObjectIdentifier = ObjectIdentifier(ViewModelCard.self)
        let identifierNewCard:ObjectIdentifier = ObjectIdentifier(ViewModelNewCard.self)
        self.updaterMap = [
            identifierCard:PresenterUpdaterCard.self,
            identifierNewCard:PresenterUpdaterNewCard.self]
    }
    
    func update() {
        var updater:PresenterUpdaterBoardItemProtocol = self.factoryUpdater()
        updater.viewBoard = self.viewBoard
        updater.viewModel = self.viewModel
        updater.column = self.column
        updater.update()
    }
    
    private func factoryUpdater() -> PresenterUpdaterBoardItemProtocol {
        let identifier:ObjectIdentifier = ObjectIdentifier(type(of:self.viewModel))
        let updaterType:PresenterUpdaterBoardItemProtocol.Type = self.updaterMap[identifier]!
        return updaterType.init()
    }
}
