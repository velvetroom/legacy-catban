import Foundation
import Board
import Shared
import Template

public class Controller:ControllerProtocol {
    public var presenter:PresenterProtocol
    public weak var transiton:TransitionProtocol!
    var dispatchQueue:DispatchQueue
    var repository:RepositoryBoardProtocol
    
    public required init() {
        self.dispatchQueue = DispatchQueue.privateBackgroundWith(identifier:ControllerConstants.queueIdentifier)
        self.repository = Configuration.repositoryBoardType.init()
        let presenter:Presenter = Presenter()
        self.presenter = presenter
        presenter.delegate = self
    }
    
    public func didLoadPresenter() {
        self.dispatchQueue.async { [weak self] in
            self?.loadBoard()
        }
    }
    
    func projectLoaded(project:ProjectManagedProtocol) {
        DispatchQueue.main.async { [weak self] in
            self?.transiton.transitionToHome(project:project)
        }
    }
    
    private func loadBoard() {
        let board:BoardProtocol
        do {
            board = try self.repository.loadBoard()
        } catch {
            board = self.newBoard()
        }
        self.boardLoaded(board:board)
    }
    
    private func boardLoaded(board:BoardProtocol) {
        guard
            board.countProjects > 0
        else { return }
        let project:ProjectProtocol = board.projectAt(index:0)
        let managed:ProjectManagedProtocol = board.manage(project:project)
        self.projectLoaded(project:managed)
    }
    
    private func newBoard() -> BoardProtocol {
        let kanbanProject:ProjectProtocol = KanbanFactory.newProject()
        let board:BoardProtocol = BoardFactory.newBoard()
        board.add(project:kanbanProject)
        do { try self.repository.save(board:board) } catch { }
        return board
    }
}
