import Foundation

class Organise:OrganiseProtocol {
    var board:BoardProtocol
    var presenter:OrganisePresenterProtocol
    
    required init() {
        self.board = Board()
        self.presenter = OrganisePresenter()
    }
}
