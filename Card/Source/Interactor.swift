import Foundation
import CleanArchitecture
import Architecture
import Shared
import Board
import Tools

public class Interactor:InteractorCardProtocol, DeleterInteractorProtocol {
    public weak var presenter:InteractorDelegateProtocol?
    public weak var card:CardProtocol!
    public weak var project:ProjectProtocol!
    public var board:BoardProtocol!

    public required init() { }
    public func deleteCancelled() { }
    
    public func deleteConfirmed() {
        self.project.remove(card:self.card)
        self.done()
    }
    
    func done() {
        self.save()
        self.presenter?.startTransition { [weak self] (transition:TransitionProtocol) in
            self?.transitionToHomeWith(transition:transition)
        }
    }
    
    private func save() {
        let repository:RepositoryProjectProtocol = Configuration.repositoryProjectType.init()
        repository.localSave(project:self.project)
    }
    
    private func transitionToHomeWith(transition:TransitionProtocol) {
        transition.transitionToHome(board:self.board, project:self.project)
    }
}
