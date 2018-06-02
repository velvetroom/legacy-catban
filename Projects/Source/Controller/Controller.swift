import Foundation
import Shared
import Board

public class Controller:ControllerBoardProtocol {
    public var presenter:PresenterProtocol
    public var board:BoardProjectsProtocol!
    public weak var transiton:TransitionProtocol!
    
    public required init() {
        let presenter:Presenter = Presenter()
        self.presenter = presenter
        presenter.delegate = self
        presenter.controller = self
    }
    
    func addProject() -> ProjectProtocol {
        let project:ProjectProtocol = ProjectFactory.newProject()
        self.board.add(project:project)
        return project
    }
    
    func openProjectWith(identifier:String) {
        let project:ProjectProtocol = self.board.projectWith(identifier:identifier)
        let projectManaged:ProjectManagedProtocol = self.board.manage(project:project)
        self.transiton.transitionToHome(project:projectManaged)
    }
    
    func update(project:String, with name:String) {
        let project:ProjectProtocol = self.board.projectWith(identifier:project)
        project.name = name
        self.presenter.shouldUpdate()
    }
    
    func deleteProjectWith(identifier:String) {
        let project:ProjectProtocol = self.board.projectWith(identifier:identifier)
        self.board.remove(project:project)
        self.presenter.shouldUpdate()
    }
}
