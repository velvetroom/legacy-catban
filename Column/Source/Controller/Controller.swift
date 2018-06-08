import Foundation
import Shared
import Board

public class Controller:InteractorProtocol {
    public weak var presenter:PresenterProtocol?
    public var project:ProjectManagedProtocol!
    public weak var column:ColumnProtocol!
    
    func done() {
//        self.save()
//        self.transiton.transitionToHome(project:self.project)
    }
    
    func delete() {
//        self.project.remove(column:self.column)
//        self.save()
//        self.transiton.transitionToHome(project:self.project)
    }
    
    private func save() {
        let repository:RepositoryProjectProtocol = Configuration.repositoryProjectType.init()
        repository.save(project:self.project)
    }
}
