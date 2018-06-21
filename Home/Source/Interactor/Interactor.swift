import Foundation
import Shared
import Board
import Tools

public class Interactor:InteractorProjectProtocol, CanvasDelegateProtocol, NamerInteractorProtocol {
    public weak var presenter:InteractorPresentationProtocol?
    public var project:ProjectManagedProtocol!
    
    public required init() { }
    
    public func editCardWith(identifier:String) {
        let card:CardProtocol = self.project.cardWith(identifier:identifier)
        self.presenter?.transition?.transitionTo(card:card, in:self.project)
    }
    
    public func editColumnWith(identifier:String) {
        let column:ColumnProtocol = self.project.columnWith(identifier:identifier)
        self.presenter?.transition?.transitionTo(column:column, in:self.project)
    }
    
    public func createNewCard() {
        let card:CardProtocol = CardFactory.newCard()
        self.project.add(card:card)
        self.presenter?.transition?.transitionTo(card:card, in:self.project)
    }
    
    public func createNewColumn() {
        var viewModel:NamerViewModelContent = NamerViewModelContent()
        viewModel.title = String.localized(key:"Interactor_Namer_Title", in:type(of:self))
        let namer:ViewProtocol = NamerFactory.makeWith(interactor:self, and:viewModel)
        self.presenter?.transition?.pushTo(view:namer)
    }
    
    public func namerFinishedWith(name:String) {
        let column:ColumnProtocol = ColumnFactory.newColumn()
        column.name = name
        self.project.add(column:column)
        self.presenter?.shouldUpdate()
        self.saveProject()
    }
    
    public func namerCancelled() {
        self.presenter?.shouldUpdate()
    }
    
    public func saveProject() {
        let repository:RepositoryProjectProtocol = Configuration.repositoryProjectType.init()
        repository.save(project:self.project)
    }
    
    func openProjects() {
        let board:BoardProjectsProtocol = self.project.manager
        board.unmanage(project:project)
        self.presenter?.transition?.transitionToProjects(board:board)
    }
    
    func closedMenu() {
        self.presenter?.shouldUpdate()
    }
}
