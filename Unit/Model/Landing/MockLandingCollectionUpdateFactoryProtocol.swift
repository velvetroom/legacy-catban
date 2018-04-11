import Foundation
@testable import catban

class MockLandingCollectionUpdateFactoryProtocol:LandingCollectionUpdateFactoryProtocol {
    var onDeleteColumnAtIndex:((Int, ProjectProtocol) -> Void)?
    var onMovingItemsFromColumn:((Int, ProjectProtocol) -> Void)?
    
    func deleteColumnAt(index:Int, in project:ProjectProtocol) -> [CollectionUpdateProtocol] {
        self.onDeleteColumnAtIndex?(index, project)
        return []
    }
    
    func movingItemsFromColumn(index:Int, in project:ProjectProtocol) -> [CollectionUpdateProtocol] {
        self.onMovingItemsFromColumn?(index, project)
        return []
    }
}
