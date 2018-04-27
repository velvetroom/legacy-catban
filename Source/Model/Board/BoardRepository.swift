import Foundation

class BoardRepository:BoardRepositoryProtocol {
    var repository:RepositoryProtocol
    var dispatchQueue:DispatchQueue
    
    init() {
        self.repository = Repository()
        self.dispatchQueue = Thread.factoryBackgroundConcurrentWith(label:Constants.threadLabel)
    }
    
    func save(board:BoardProtocol) {
        self.dispatchQueue.async { [weak self] in
            do {
                try self?.repository.localSave(board:board)
            } catch { }
        }
    }
}
