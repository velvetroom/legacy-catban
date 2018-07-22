import Foundation
import CleanArchitecture
import Architecture
import Shared
import Board
import Tools

public class Interactor:InteractorColumnProtocol, NamerInteractorProtocol, DeleterInteractorProtocol {
    public weak var presenter:InteractorDelegateProtocol?
    public weak var project:ProjectProtocol!
    public weak var column:ColumnProtocol!
    public var board:BoardProtocol!
    
    public required init() { }
    public func namerCancelled() { }
    public func deleteCancelled() { }
    
    public func namerFinishedWith(name:String) {
        self.column.name = name
        self.save()
        self.presenter?.shouldUpdate()
    }
    
    public func deleteConfirmed() {
        self.project.remove(column:self.column)
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
