import Foundation
@testable import catban

class MockLoadProtocol:LoadProtocol {
    var onLoadBoard:(() -> Void)?
    var repository:RepositoryProtocol
    var dispatchQueue:DispatchQueue
    
    init() {
        self.repository = Repository()
        self.dispatchQueue = Thread.factoryBackgroundConcurrentWith(label:String())
    }
    
    func loadBoard(completion:@escaping((BoardProtocol) -> Void)) {
        self.onLoadBoard?()
    }
}
