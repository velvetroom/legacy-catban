import Foundation
import Shared
import Board

public class Controller:ControllerProtocol {
    public var transiton:TransitionProtocol!
    public var presenter:PresenterProtocol
    var dispatchQueue:DispatchQueue
    var repository:RepositoryBoardProtocol
    
    public required init() {
        self.dispatchQueue = DispatchQueue.privateBackgroundWith(identifier:ControllerConstants.queueIdentifier)
        self.repository = Configuration.repositoryBoardType.init()
        self.presenter = Presenter()
        self.presenter.delegate = self
    }
    
    deinit {
        print("deinit")
    }
    
    public func viewDidLoad() {
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
        let board:BoardProtocol = BoardFactory.newBoard()
        do { try self.repository.save(board:board) } catch { }
        return board
    }
}
