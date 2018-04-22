import Foundation
@testable import catban

class MockLandingCollectionUpdateFactoryProtocol:LandingCollectionUpdateFactoryProtocol {
    var onCreateProject:(() -> Void)?
    var onDeleteColumnAtIndex:((Int, ProjectProtocol) -> Void)?
    var onMovingItemsFromColumn:((Int, ProjectProtocol) -> Void)?
    var onInsertColumnIn:((ProjectProtocol) -> Void)?
    
    func deleteColumnAt(index:Int, in project:ProjectProtocol) throws -> [CollectionUpdateProtocol] {
        self.onDeleteColumnAtIndex?(index, project)
        return []
    }
    
    func salvageItemsFromColumn(index:Int, in project:ProjectProtocol) throws -> [CollectionUpdateProtocol] {
        self.onMovingItemsFromColumn?(index, project)
        return []
    }
    
    func insertColumnIn(project:ProjectProtocol) -> [CollectionUpdateProtocol] {
        self.onInsertColumnIn?(project)
        return []
    }
    
    func createProject() -> [CollectionUpdateProtocol] {
        self.onCreateProject?()
        return []
    }
}
