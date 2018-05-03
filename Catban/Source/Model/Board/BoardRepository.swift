import Foundation

class BoardRepository:BoardRepositoryProtocol {
    var repository:RepositoryProtocol
    var dispatchQueue:DispatchQueue
    
    init() {
        self.repository = Repository()
        self.dispatchQueue = Thread.factoryBackgroundConcurrentWith(label:Constants.threadLabel)
    }
}
