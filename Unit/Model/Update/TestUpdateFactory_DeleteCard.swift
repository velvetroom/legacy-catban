import XCTest
@testable import catban

class TestUpdateFactory_DeleteCard:XCTestCase {
    private var model:UpdateFactory!
    private struct Constants {
        static let indexPath:IndexPath = IndexPath(item:12, section:21)
    }
    
    override func setUp() {
        super.setUp()
        self.model = UpdateFactory()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load factory")
    }
    
    func testReturnsOneItem() {
        let updates:[UpdateProtocol] = self.model.deleteCardAt(index:Constants.indexPath)
        XCTAssertEqual(updates.count, 1, "Invalid number of updates received")
    }
    
    func testItemType() {
        let updates:[UpdateProtocol] = self.model.deleteCardAt(index:Constants.indexPath)
        let update:UpdateDeleteCard = updates.first as! UpdateDeleteCard
        XCTAssertNotNil(update, "Invalid update type")
    }
    
    func testOriginIndex() {
        let updates:[UpdateProtocol] = self.model.deleteCardAt(index:Constants.indexPath)
        let update:UpdateDeleteCard = updates.first as! UpdateDeleteCard
        XCTAssertEqual(update.index, Constants.indexPath, "Failed to assign index")
    }
}
