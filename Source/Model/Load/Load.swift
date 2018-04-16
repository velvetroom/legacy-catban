import Foundation

class Load:LoadProtocol {
    var dispatchQueue:DispatchQueue
    
    init() {
        self.dispatchQueue = Thread.factoryBackgroundConcurrentWith(label:Constants.threadLabel)
    }
    
    func loadBoard(completion:@escaping((Board) -> Void)) {
        
    }
    
    func backgroundLoadBoard(completion:@escaping((Board) -> Void)) {
        
    }
}
