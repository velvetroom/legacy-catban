import Foundation
import Board
import Shared
import Template

public class Controller:ControllerProtocol {
    public var presenter:PresenterProtocol
    public var transiton:TransitionProtocol!
    var dispatchQueue:DispatchQueue
    var repository:RepositoryBoardProtocol
    
    public required init() {
        self.dispatchQueue = DispatchQueue.privateBackgroundWith(identifier:ControllerConstants.queueIdentifier)
        self.repository = Configuration.repositoryBoardType.init()
        self.presenter = Presenter()
        self.presenter.delegate = self
    }
    
    public func didLoadPresenter() {
        self.dispatchQueue.async { [weak self] in
            self?.loadBoard()
        }
    }
    
    func boardLoaded(board:BoardProtocol) {
        DispatchQueue.main.async { [weak self] in
            self?.transiton.transitionToHome()
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
    
    private func newBoard() -> BoardProtocol {
        let kanbanProject:ProjectProtocol = KanbanFactory.newProject()
        let board:BoardProtocol = BoardFactory.newBoard()
        board.add(project:kanbanProject)
        do { try self.repository.save(board:board) } catch { }
        return board
    }
}
