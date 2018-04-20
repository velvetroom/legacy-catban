import Foundation
@testable import catban

class MockOrganiseProtocol:OrganiseProtocol {
    var board:BoardProtocol
    var presenter:OrganisePresenterProtocol
    
    required init() {
        self.board = Board()
        self.presenter = OrganisePresenter()
    }
}
