import XCTest
@testable import catban

class TestUpdateFactory_MoveCard:XCTestCase {
    private var model:UpdateFactory!
    private struct Constants {
        static let origin:IndexPath = IndexPath(item:12, section:21)
        static let destination:IndexPath = IndexPath(item:22, section:11)
    }
    
    override func setUp() {
        super.setUp()
        self.model = UpdateFactory()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load factory")
    }
    
    func testReturnsOneItem() {
        let updates:[UpdateProtocol] = self.model.moveCardFrom(origin:Constants.origin, to:Constants.destination)
        XCTAssertEqual(updates.count, 1, "Invalid number of updates received")
    }
    
    func testItemType() {
        let updates:[UpdateProtocol] = self.model.moveCardFrom(origin:Constants.origin, to:Constants.destination)
        let update:UpdateMoveCard = updates.first as! UpdateMoveCard
        XCTAssertNotNil(update, "Invalid update type")
    }
    
    func testOriginIndex() {
        let updates:[UpdateProtocol] = self.model.moveCardFrom(origin:Constants.origin, to:Constants.destination)
        let update:UpdateMoveCard = updates.first as! UpdateMoveCard
        XCTAssertEqual(update.origin, Constants.origin, "Failed to assign origin index")
    }
    
    func testDestinationIndex() {
        let updates:[UpdateProtocol] = self.model.moveCardFrom(origin:Constants.origin, to:Constants.destination)
        let update:UpdateMoveCard = updates.first as! UpdateMoveCard
        XCTAssertEqual(update.destination, Constants.destination, "Failed to assign destination index")
    }
}
