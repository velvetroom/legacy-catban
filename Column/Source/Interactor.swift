import Foundation
import CleanArchitecture
import Architecture
import Shared
import Board
import Tools

public class Interactor:InteractorColumnProtocol, NamerInteractorProtocol, DeleterInteractorProtocol {
    public weak var presenter:InteractorDelegateProtocol?
    public weak var column:ColumnProtocol!
    public var project:ProjectManagedProtocol!
    
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
        self.presenter?.shouldTransition { (transition:TransitionProtocol?) in
            transition?.transitionToHome(project:self.project)
        }
    }
    
    private func save() {
        let repository:RepositoryProjectProtocol = Configuration.repositoryProjectType.init()
        repository.save(project:self.project)
    }
}
