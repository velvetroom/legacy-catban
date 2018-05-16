import Foundation

class PresenterUpdaterBoardItems:PresenterUpdaterProtocol {
    var outlets:PresenterOutlets!
    var viewModel:ViewModel!
    var controller:Controller!
    var drag:Drag!
    var updaterMap:[ObjectIdentifier:PresenterUpdaterBoardItemProtocol.Type]
    private var viewBoard:ViewBoard!
    
    required init() {
        let identifierCard:ObjectIdentifier = ObjectIdentifier(ViewModelCard.self)
        let identifierNewCard:ObjectIdentifier = ObjectIdentifier(ViewModelNewCard.self)
        self.updaterMap = [
            identifierCard:PresenterUpdaterCard.self,
            identifierNewCard:PresenterUpdaterNewCard.self]
    }
    
    func update() {
        guard
            let viewBoard:ViewBoard = self.outlets.viewBoard
        else { return }
        self.viewBoard = viewBoard
        self.clearItems()
        for item:ViewModelBoardItemProtocol in self.viewModel.items {
            self.factoryViewsFor(item:item)
        }
    }
    
    private func clearItems() {
        for item:ViewBoardItem in self.viewBoard.items {
            item.removeFromSuperview()
        }
        self.viewBoard.items = []
    }
    
    private func factoryViewsFor(item:ViewModelBoardItemProtocol) {
        var updater:PresenterUpdaterBoardItemProtocol = self.updaterFor(item:item)
        updater.controller = self.controller
        updater.viewBoard = self.viewBoard
        updater.drag = self.drag
        updater.viewModel = item
        updater.factoryView()
    }
    
    private func updaterFor(item:ViewModelBoardItemProtocol) -> PresenterUpdaterBoardItemProtocol {
        let identifier:ObjectIdentifier = ObjectIdentifier(type(of:item))
        let updaterType:PresenterUpdaterBoardItemProtocol.Type = self.updaterMap[identifier]!
        return updaterType.init()
    }
}
