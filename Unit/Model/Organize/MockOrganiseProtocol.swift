import Foundation
@testable import catban

class MockOrganiseProtocol:OrganiseProtocol {
    var onReloadViewModel:(() -> Void)?
    var board:BoardProtocol
    var presenter:OrganisePresenterProtocol
    required init() {
        self.board = Board()
        self.presenter = OrganisePresenter()
    }
    
    func reloadViewModel() {
        self.onReloadViewModel?()
    }
}
