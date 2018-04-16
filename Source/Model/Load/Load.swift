import Foundation

class Load:LoadProtocol {
    var dispatchQueue:DispatchQueue
    
    init() {
        self.dispatchQueue = Thread.factoryBackgroundConcurrentWith(label:Constants.threadLabel)
    }
    
    func loadBoard(completion:@escaping((BoardProtocol) -> Void)) {
        self.dispatchQueue.async { [weak self] in
            guard
                let board:BoardProtocol = self?.backgroundLoadBoard()
            else {
                return
            }
            DispatchQueue.main.async {
                completion(board)
            }
        }
    }
    
    func backgroundLoadBoard() -> BoardProtocol {
        return Board()
    }
}
