import Foundation

class Load:LoadProtocol {
    var repository:RepositoryProtocol
    var dispatchQueue:DispatchQueue
    
    required init() {
        self.repository = Repository()
        self.dispatchQueue = Thread.factoryBackgroundConcurrentWith(label:Constants.threadLabel)
    }
    
    func loadBoard(completion:@escaping((BoardProtocol) -> Void)) {
        self.dispatchQueue.async { [weak self] in
            guard
                let board:BoardProtocol = self?.backgroundLoadBoard()
            else { return }
            DispatchQueue.main.async {
                completion(board)
            }
        }
    }
    
    func backgroundLoadBoard() -> BoardProtocol {
        let board:BoardProtocol
        do {
            try board = self.repository.loadBoard()
        } catch {
            board = self.createNewBoard()
        }
        return board
    }
    
    func createNewBoard() -> BoardProtocol {
        let board:BoardProtocol = Board.factoryNewBoard()
        do { try self.repository.save(board:board) } catch { }
        return board
    }
}