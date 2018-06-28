import Foundation
import CleanArchitecture
import Architecture
import Shared
import Board

public class Interactor:InteractorBoardProtocol {
    public weak var presenter:InteractorDelegateProtocol?
    public var board:BoardProtocol!
    var state:StateProtocol
    
    public required init() {
        self.state = StateDefault()
    }
    
    func updated(project:ProjectProtocol) {
        self.save(project:project)
    }
    
    func add(project:ProjectProtocol) {
        self.board.add(project:project)
        self.save(project:project)
    }
    
    func openProjectWith(identifier:String) {
        let project:ProjectProtocol = self.board.projectWith(identifier:identifier)
        self.presenter?.startTransition { [weak self] (transition:TransitionProtocol) in
            if let board:BoardProtocol = self?.board {
                transition.transitionToHome(board:board, project:project)
            }
        }
    }
    
    func delete(project:ProjectProtocol) {
        self.board.remove(project:project)
        self.deleteFromRepository(project:project)
        self.presenter?.shouldUpdate()
    }
    
    private func deleteFromRepository(project:ProjectProtocol) {
        let repository:RepositoryProjectProtocol = Configuration.repositoryProjectType.init()
        repository.delete(project:project)
    }
    
    private func save(project:ProjectProtocol) {
        let repository:RepositoryProjectProtocol = Configuration.repositoryProjectType.init()
        repository.save(project:project)
    }
}
