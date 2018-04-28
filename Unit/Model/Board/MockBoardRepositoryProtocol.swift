import Foundation
@testable import catban

class MockBoardRepositoryProtocol:BoardRepositoryProtocol {
    var onSaveBoard:((BoardProtocol) -> Void)?
    
    func save(board:BoardProtocol) {
        self.onSaveBoard?(board)
    }
}
