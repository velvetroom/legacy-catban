import Foundation
@testable import catban

class MockOrganiseProtocol:OrganiseProtocol {
    var onReloadViewModel:(() -> Void)?
    var onSelectProjectAtIndex:((Int) -> Void)?
    var board:BoardProtocol
    var presenter:OrganisePresenterProtocol
    
    required init() {
        self.board = Board()
        self.presenter = OrganisePresenter()
    }
    
    func reloadViewModel() {
        self.onReloadViewModel?()
    }
    
    func selectProjectAt(index:Int) {
        self.onSelectProjectAtIndex?(index)
    }
}
