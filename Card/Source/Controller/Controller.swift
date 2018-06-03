import Foundation
import Shared
import Board

public class Controller:ControllerCardProtocol {
    public var presenter:PresenterProtocol
    public var project:ProjectManagedProtocol!
    public weak var card:CardProtocol!
    public weak var transiton:TransitionProtocol!

    public required init() {
        let presenter:Presenter = Presenter()
        self.presenter = presenter
        presenter.delegate = self
        presenter.controller = self
    }
    
    func done() {
        self.save()
        self.transiton.transitionToHome(project:self.project)
    }
    
    func delete() {
        self.project.remove(card:self.card)
        self.save()
        self.transiton.transitionToHome(project:self.project)
    }
    
    func update(content:String) {
        self.card.content = content
    }
    
    private func save() {
        let repository:RepositoryProjectProtocol = Configuration.repositoryProjectType.init()
        repository.save(project:self.project)
    }
}
