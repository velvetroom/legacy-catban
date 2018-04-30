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
    
    func selectProjectAt(index:Int) {
        self.board.selectProjectAt(index:index)
        self.board.saveUser()
    }
}
