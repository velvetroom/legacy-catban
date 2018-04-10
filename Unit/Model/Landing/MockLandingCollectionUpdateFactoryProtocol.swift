import Foundation
@testable import catban

class MockLandingCollectionUpdateFactoryProtocol:LandingCollectionUpdateFactoryProtocol {
    var onMovingItemsFromColumn:((Int, ProjectProtocol) -> Void)?
    
    func movingItemsFromColumn(index:Int, in project:ProjectProtocol) -> [CollectionUpdateProtocol] {
        self.onMovingItemsFromColumn?(index, project)
        return []
    }
}
