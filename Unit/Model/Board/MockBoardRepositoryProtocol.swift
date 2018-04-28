import Foundation
@testable import catban

class MockBoardRepositoryProtocol:BoardRepositoryProtocol {
    var onDeleteProject:((ProjectProtocol) -> Void)?
    
    func delete(project:ProjectProtocol) {
        self.onDeleteProject?(project)
    }
}
