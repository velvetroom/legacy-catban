import Foundation
import Shared
import Board

public class Controller:InteractorProtocol {
    public weak var presenter:PresenterProtocol?
    public var project:ProjectManagedProtocol!
    public weak var card:CardProtocol!

    func done() {
//        self.save()
//        self.transiton.transitionToHome(project:self.project)
    }
    
    func delete() {
//        self.project.remove(card:self.card)
//        self.save()
//        self.transiton.transitionToHome(project:self.project)
    }
    
    func update(content:String) {
//        self.card.content = content
    }
    
    private func save() {
        let repository:RepositoryProjectProtocol = Configuration.repositoryProjectType.init()
        repository.save(project:self.project)
    }
}
