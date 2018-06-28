import Foundation
import CleanArchitecture
import Architecture
import Shared
import Board
import Tools

public class Interactor:InteractorProjectProtocol, CanvasDelegateProtocol, NamerInteractorProtocol {
    public weak var presenter:InteractorDelegateProtocol?
    public weak var project:ProjectProtocol!
    public var board:BoardProtocol!
    
    public required init() { }
    
    public func editCardWith(identifier:String) {
        let card:CardProtocol = self.project.cardWith(identifier:identifier)
        self.presenter?.startTransition { [weak self] (transition:TransitionProtocol) in
            self?.start(transition:transition, to:card)
        }
    }
    
    public func editColumnWith(identifier:String) {
        let column:ColumnProtocol = self.project.columnWith(identifier:identifier)
        self.presenter?.startTransition { [weak self] (transition:TransitionProtocol) in
            self?.start(transition:transition, to:column)
        }
    }
    
    public func createNewCard() {
        let card:CardProtocol = CardFactory.newCard()
        self.project.add(card:card)
        self.presenter?.startTransition { [weak self] (transition:TransitionProtocol) in
            self?.start(transition:transition, to:card)
        }
    }
    
    public func createNewColumn() {
        var viewModel:NamerViewModelContent = NamerViewModelContent()
        viewModel.title = String.localized(key:"Interactor_Namer_Title", in:type(of:self))
        let namer:ViewProtocol = NamerFactory.makeWith(interactor:self, and:viewModel)
        self.presenter?.startTransition { (transition:TransitionProtocol) in
            transition.pushTo(view:namer)
        }
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
    
    func openCloud() {
        self.presenter?.startTransition { (transition:TransitionProtocol) in
            guard
                let board:BoardProtocol = self.board,
                let project:ProjectProtocol = self.project
            else { return }
            transition.transitionToCloud(board:board, project:project)
        }
    }
    
    func openProjects() {
        self.presenter?.startTransition { (transition:TransitionProtocol) in
            if let board:BoardProtocol = self.board {
                transition.transitionToProjects(board:board)
            }
        }
    }
    
    func closedMenu() {
        self.presenter?.shouldUpdate()
    }
    
    private func start(transition:TransitionProtocol, to card:CardProtocol) {
        transition.transitionTo(card:card, board:self.board, project:self.project)
    }
    
    private func start(transition:TransitionProtocol, to column:ColumnProtocol) {
        transition.transitionTo(column:column, board:self.board, project:self.project)
    }
}
