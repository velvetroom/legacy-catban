import Foundation
import CleanArchitecture
import Architecture
import Shared
import Board
import Tools

public class Interactor:InteractorCardProtocol, DeleterInteractorProtocol {
    public weak var presenter:InteractorDelegateProtocol?
    public weak var card:CardProtocol!
    public var project:ProjectManagedProtocol!

    public required init() { }
    public func deleteCancelled() { }
    
    public func deleteConfirmed() {
        self.project.remove(card:self.card)
        self.done()
    }
    
    func done() {
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
