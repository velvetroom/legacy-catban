import Foundation
@testable import catban

class MockBoardRepositoryProtocol:BoardRepositoryProtocol {
    var onDeleteProject:((ProjectProtocol) -> Void)?
    var onSaveProject:((ProjectProtocol) -> Void)?
    
    func delete(project:ProjectProtocol) {
        self.onDeleteProject?(project)
    }
    
    func save(project:ProjectProtocol) {
        self.onSaveProject?(project)
    }
}
