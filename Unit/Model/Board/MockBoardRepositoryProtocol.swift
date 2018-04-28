import Foundation
@testable import catban

class MockBoardRepositoryProtocol:BoardRepositoryProtocol {
    var onSaveBoard:((BoardProtocol) -> Void)?
    var onDeleteProject:((ProjectProtocol) -> Void)?
    
    func save(board:BoardProtocol) {
        self.onSaveBoard?(board)
    }
    
    func delete(project:ProjectProtocol) {
        self.onDeleteProject?(project)
    }
}
