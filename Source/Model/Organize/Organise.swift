import Foundation

class Organise:OrganiseProtocol {
    var board:BoardProtocol
    var presenter:OrganisePresenterProtocol
    
    init() {
        self.board = Board()
        self.presenter = OrganisePresenter()
    }
}
