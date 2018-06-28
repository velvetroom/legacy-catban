import Foundation
import CleanArchitecture
import Architecture
import Shared
import Board
import Template

public class Interactor:InteractorProtocol {
    public weak var presenter:InteractorDelegateProtocol?
    var dispatchQueue:DispatchQueue
    
    public required init() {
        self.dispatchQueue = DispatchQueue.privateBackgroundWith(identifier:Constants.queueIdentifier)
    }
    
    public func didLoad() {
        self.dispatchQueue.async { [weak self] in
            self?.loadBoard()
        }
    }
    
    func open(board:BoardProtocol, project:ProjectProtocol) {
        self.transitionOnMainThread { (transition:TransitionProtocol?) in
            transition?.transitionToHome(board:board, project:project)
        }
    }
    
    func open(board:BoardProtocol) {
        self.transitionOnMainThread { (transition:TransitionProtocol?) in
            transition?.transitionToProjects(board:board)
        }
    }
    
    private func loadBoard() {
        let repository:RepositoryBoardProtocol = Configuration.repositoryBoardType.init()
        let board:BoardProtocol
        do {
            board = try repository.loadBoard()
        } catch {
            board = self.firstTime()
        }
        self.boardLoaded(board:board)
    }
    
    private func boardLoaded(board:BoardProtocol) {
        guard
            board.countProjects == 1,
            let project:ProjectProtocol = board.firstProject
        else {
            self.open(board:board)
            return
        }
        self.open(board:board, project:project)
    }
    
    private func firstTime() -> BoardProtocol {
        let board:BoardProtocol = self.newBoard()
        let project:ProjectProtocol = self.newProject()
        board.add(project:project)
        return board
    }
    
    private func newBoard() -> BoardProtocol {
        let board:BoardProtocol = BoardFactory.newBoard()
        self.save(board:board)
        return board
    }
    
    private func newProject() -> ProjectProtocol {
        let project:ProjectProtocol = KanbanFactory.newProject()
        self.save(project:project)
        return project
    }
    
    private func save(board:BoardProtocol) {
        let repository:RepositoryBoardProtocol = Configuration.repositoryBoardType.init()
        repository.save(board:board)
    }
    
    private func save(project:ProjectProtocol) {
        let repository:RepositoryProjectProtocol = Configuration.repositoryProjectType.init()
        repository.save(project:project)
    }
    
    private func transitionOnMainThread(completion:@escaping((TransitionProtocol?) -> Void)) {
        DispatchQueue.main.async { [weak self] in
            self?.presenter?.shouldTransition(completion:completion)
        }
    }
}
