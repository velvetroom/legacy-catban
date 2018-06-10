import Foundation
import Shared
import Board

public class Controller:InteractorProtocol, CanvasDelegateProtocol {
    public weak var presenter:InteractorPresentationProtocol?
    public var project:ProjectManagedProtocol!
    
    public required init() { }
    
    public func editCardWith(identifier:String) {
//        let card:CardProtocol = self.project.cardWith(identifier:identifier)
//        self.transiton.transitionTo(card:card, in:self.project)
    }
    
    public func editColumnWith(identifier:String) {
//        let column:ColumnProtocol = self.project.columnWith(identifier:identifier)
//        self.transiton.transitionTo(column:column, in:self.project)
    }
    
    public func createNewCard() {
//        let card:CardProtocol = CardFactory.newCard()
//        self.project.add(card:card)
//        self.transiton.transitionTo(card:card, in:self.project)
    }
    
    public func createNewColumn() {
//        let column:ColumnProtocol = ColumnFactory.newColumn()
//        self.project.add(column:column)
//        self.transiton.transitionTo(column:column, in:self.project)
    }
    
    public func saveProject() {
        let repository:RepositoryProjectProtocol = Configuration.repositoryProjectType.init()
        repository.save(project:self.project)
    }
    
    func openProjects() {
//        let board:BoardProjectsProtocol = self.project.manager
//        board.unmanage(project:project)
//        self.transiton.transitionToProjects(board:board)
    }
}
