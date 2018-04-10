import Foundation
@testable import catban

class MockLandingCollectionUpdateFactoryProtocol:LandingCollectionUpdateFactoryProtocol {
    var onUpdatesForMovingItemsFromColumn:((Int, ProjectProtocol) -> Void)?
    
    func updatesForMovingItemsFromColumn(index:Int, in project:ProjectProtocol) -> [CollectionUpdateProtocol] {
        self.onUpdatesForMovingItemsFromColumn?(index, project)
        return []
    }
}
