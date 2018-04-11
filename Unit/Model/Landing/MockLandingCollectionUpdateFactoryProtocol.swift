import Foundation
@testable import catban

class MockLandingCollectionUpdateFactoryProtocol:LandingCollectionUpdateFactoryProtocol {
    var onDeleteColumnAtIndex:((Int) -> Void)?
    var onMovingItemsFromColumn:((Int, ProjectProtocol) -> Void)?
    
    func deleteColumnAt(index:Int) -> [CollectionUpdateProtocol] {
        self.onDeleteColumnAtIndex?(index)
        return []
    }
    
    func movingItemsFromColumn(index:Int, in project:ProjectProtocol) -> [CollectionUpdateProtocol] {
        self.onMovingItemsFromColumn?(index, project)
        return []
    }
}
