import Foundation
import Shared
import Board
import Tools

public class Interactor:InteractorBoardProtocol, DeleterInteractorProtocol {
    public weak var presenter:InteractorPresentationProtocol?
    public var board:BoardProjectsProtocol!
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
        let projectManaged:ProjectManagedProtocol = self.board.manage(project:project)
        self.presenter?.transition?.transitionToHome(project:projectManaged)
    }
    
    
    
    
    public func deleteConfirmed() {
        
    }
    
    public func deleteCancelled() {
        
    }
    
    func addProject() -> ProjectProtocol {
        let project:ProjectProtocol = ProjectFactory.newProject()
        self.board.add(project:project)
        self.save(project:project)
        return project
    }
    
    
    
    func deleteProjectWith(identifier:String) {
        let project:ProjectProtocol = self.board.projectWith(identifier:identifier)
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
