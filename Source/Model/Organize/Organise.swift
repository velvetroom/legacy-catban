import Foundation

class Organise:OrganiseProtocol {
    var board:BoardProtocol
    var presenter:OrganisePresenterProtocol
    
    required init() {
        self.board = Board()
        self.presenter = OrganisePresenter()
    }
    
    func reloadViewModel() {
        self.presenter.updateWith(board:self.board)
    }
}
