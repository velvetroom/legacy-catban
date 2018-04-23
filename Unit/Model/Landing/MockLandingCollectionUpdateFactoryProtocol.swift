import Foundation
@testable import catban

class MockLandingCollectionUpdateFactoryProtocol:LandingCollectionUpdateFactoryProtocol {
    var onCreateProject:(() -> Void)?
    var onDeleteColumnAtIndex:((Int, ProjectProtocol) -> Void)?
    var onMovingItemsFromColumn:((Int, ProjectProtocol) -> Void)?
    var onCreateColumnIn:((ProjectProtocol) -> Void)?
    var onDeleteProject:((BoardProtocol) -> Void)?
    
    func deleteColumnAt(index:Int, in project:ProjectProtocol) throws -> [CollectionUpdateProtocol] {
        self.onDeleteColumnAtIndex?(index, project)
        return []
    }
    
    func salvageItemsFromColumn(index:Int, in project:ProjectProtocol) throws -> [CollectionUpdateProtocol] {
        self.onMovingItemsFromColumn?(index, project)
        return []
    }
    
    func createColumnIn(project:ProjectProtocol) -> [CollectionUpdateProtocol] {
        self.onCreateColumnIn?(project)
        return []
    }
    
    func createProject() -> [CollectionUpdateProtocol] {
        self.onCreateProject?()
        return []
    }
    
    func deleteProject(board:BoardProtocol) throws -> [CollectionUpdateProtocol] {
        self.onDeleteProject?(board)
        return []
    }
}
