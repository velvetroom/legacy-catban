import Foundation
@testable import catban

class MockBoardRepositoryProtocol:BoardRepositoryProtocol {
    var onSaveBoard:((BoardProtocol) -> Void)?
    var repository:RepositoryProtocol
    var dispatchQueue:DispatchQueue
    
    init() {
        self.repository = Repository()
        self.dispatchQueue = DispatchQueue.global(qos:DispatchQoS.QoSClass.background)
    }
    
    func save(board:BoardProtocol) {
        self.onSaveBoard?(board)
    }
}
