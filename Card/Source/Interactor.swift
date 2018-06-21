import Foundation
import Shared
import Board
import Tools

public class Interactor:InteractorCardProtocol, DeleterInteractorProtocol {
    public weak var presenter:InteractorPresentationProtocol?
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
        self.presenter?.transition?.transitionToHome(project:self.project)
    }
    
    private func save() {
        let repository:RepositoryProjectProtocol = Configuration.repositoryProjectType.init()
        repository.save(project:self.project)
    }
}
