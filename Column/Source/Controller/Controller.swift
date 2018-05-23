import Foundation
import Shared
import Board

public class Controller:ControllerColumnProtocol {
    public var presenter:PresenterProtocol
    public var project:ProjectManagedProtocol!
    public weak var column:ColumnProtocol!
    public weak var transiton:TransitionProtocol!
    
    public required init() {
        let presenter:Presenter = Presenter()
        self.presenter = presenter
        presenter.delegate = self
        presenter.controller = self
    }
    
    func done() {
        self.transiton.transitionToHome(project:self.project)
    }
    
    func delete() {
        self.project.remove(column:self.column)
        self.transiton.transitionToHome(project:self.project)
    }
}
