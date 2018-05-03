import XCTest
@testable import catban

class TestUpdateFactory_CreateCard:XCTestCase {
    private var model:UpdateFactory!
    private struct Constants {
        static let indexPath:IndexPath = IndexPath(item:123, section:342)
    }
    
    override func setUp() {
        super.setUp()
        self.model = UpdateFactory()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
    }
    
    func testReturnsOneUpdate() {
        let updates:[UpdateProtocol] = self.model.createCard(indexPath:Constants.indexPath)
        XCTAssertEqual(updates.count, 1, "Invalid numnber of updates received")
    }
    
    func testUpdateType() {
        let updates:[UpdateProtocol] = self.model.createCard(indexPath:Constants.indexPath)
        let update:UpdateCreateCard = updates.first as! UpdateCreateCard
        XCTAssertNotNil(update, "Invalid update received")
    }
    
    func testUpdateIndexPath() {
        let updates:[UpdateProtocol] = self.model.createCard(indexPath:Constants.indexPath)
        let update:UpdateCreateCard = updates.first as! UpdateCreateCard
        XCTAssertEqual(update.indexPath, Constants.indexPath, "Invalid index path")
    }
}
