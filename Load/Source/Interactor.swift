import Foundation
import Board
import Shared
import Template

public class Interactor:InteractorProtocol {
    public weak var presenter:InteractorPresentationProtocol?
    var dispatchQueue:DispatchQueue
    
    public required init() {
        self.dispatchQueue = DispatchQueue.privateBackgroundWith(identifier:Constants.queueIdentifier)
    }
    
    public func didLoad() {
        self.dispatchQueue.async { [weak self] in
            self?.loadBoard()
        }
    }
    
    func open(project:ProjectManagedProtocol) {
        DispatchQueue.main.async { [weak self] in
            self?.presenter?.transition?.transitionToHome(project:project)
        }
    }
    
    func open(board:BoardProjectsProtocol) {
        DispatchQueue.main.async { [weak self] in
            self?.presenter?.transition?.transitionToProjects(board:board)
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
        if board.countProjects == 1 {
            self.boardWithOneProject(board:board)
        } else {
            self.open(board:board)
        }
    }
    
    private func boardWithOneProject(board:BoardProtocol) {
        guard
            let project:ProjectProtocol = board.firstProject
        else { return }
        let managed:ProjectManagedProtocol = board.manage(project:project)
        self.open(project:managed)
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
}