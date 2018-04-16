import Foundation
@testable import catban

class MockLoadProtocol:LoadProtocol {
    var onLoadBoard:(() -> Void)?
    var dispatchQueue:DispatchQueue
    
    init() {
        self.dispatchQueue = Thread.factoryBackgroundConcurrentWith(label:String())
    }
    
    func loadBoard(completion:@escaping((Board) -> Void)) {
        self.onLoadBoard?()
    }
}
