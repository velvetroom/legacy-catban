import Foundation

class PresenterUpdaterBoardItems:PresenterUpdaterProtocol {
    var outlets:PresenterOutlets!
    var viewModel:ViewModel!
    var controller:Controller!
    private var viewBoard:ViewBoard!
    private let updaterMap:[ObjectIdentifier:PresenterUpdaterBoardItemProtocol.Type]
    
    required init() {
        let identifierCard:ObjectIdentifier = ObjectIdentifier(ViewModelCard.self)
        let identifierNewCard:ObjectIdentifier = ObjectIdentifier(ViewModelNewCard.self)
        self.updaterMap = [
            identifierCard:PresenterUpdaterCard.self,
            identifierNewCard:PresenterUpdaterNewCard.self]
    }
    
    func update() {
        self.viewBoard = self.outlets.viewBoard!
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
        updater.viewModel = item
        updater.viewBoard = self.viewBoard
        updater.factoryView()
    }
    
    private func updaterFor(item:ViewModelBoardItemProtocol) -> PresenterUpdaterBoardItemProtocol {
        let identifier:ObjectIdentifier = ObjectIdentifier(type(of:item))
        let updaterType:PresenterUpdaterBoardItemProtocol.Type = self.updaterMap[identifier]!
        return updaterType.init()
    }
}
