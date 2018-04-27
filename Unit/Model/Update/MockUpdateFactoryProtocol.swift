import Foundation
@testable import catban

class MockUpdateFactoryProtocol:UpdateFactoryProtocol {
    var onCreateProject:(() -> Void)?
    var onDeleteColumnAtIndex:((Int, ProjectProtocol) -> Void)?
    var onMovingItemsFromColumn:((Int, ProjectProtocol) -> Void)?
    var onCreateColumnIn:((ProjectProtocol) -> Void)?
    var onDeleteProject:((BoardProtocol) -> Void)?
    
    func deleteColumnAt(index:Int, in project:ProjectProtocol) throws -> [UpdateProtocol] {
        self.onDeleteColumnAtIndex?(index, project)
        return []
    }
    
    func salvageItemsFromColumn(index:Int, in project:ProjectProtocol) throws -> [UpdateProtocol] {
        self.onMovingItemsFromColumn?(index, project)
        return []
    }
    
    func createColumnIn(project:ProjectProtocol) -> [UpdateProtocol] {
        self.onCreateColumnIn?(project)
        return []
    }
    
    func createProject() -> [UpdateProtocol] {
        self.onCreateProject?()
        return []
    }
    
    func deleteProject(board:BoardProtocol) throws -> [UpdateProtocol] {
        self.onDeleteProject?(board)
        return []
    }
}
