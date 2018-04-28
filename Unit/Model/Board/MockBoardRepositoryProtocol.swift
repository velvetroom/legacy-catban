import Foundation
@testable import catban

class MockBoardRepositoryProtocol:BoardRepositoryProtocol {
    var onDeleteProject:((ProjectProtocol) -> Void)?
    var onSaveProject:((ProjectProtocol) -> Void)?
    var onSaveUser:((UserProtocol) -> Void)?
    
    func delete(project:ProjectProtocol) {
        self.onDeleteProject?(project)
    }
    
    func save(project:ProjectProtocol) {
        self.onSaveProject?(project)
    }
    
    func save(user:UserProtocol) {
        self.onSaveUser?(user)
    }
}
