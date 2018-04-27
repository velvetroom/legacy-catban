import XCTest
@testable import catban

class TestHistory_Cards:XCTestCase {
    private var model:History!
    
    override func setUp() {
        super.setUp()
        self.model = History()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
    }
    
    func testInitiallyEmpty() {
        XCTAssertTrue(self.model.items.isEmpty, "There should be no items in history")
    }
    
    func testCreateCard() {
        let card:ProjectCard = ProjectCard()
        
        self.model.created(card:card)
        
        let item:HistoryItemCreateCard? = self.model.items.first as? HistoryItemCreateCard
        XCTAssertEqual(self.model.items.count, 1, "Failed to add item")
        XCTAssertNotNil(item, "Invalid item type created")
        XCTAssertTrue(item?.card === card, "Failed to assign card to item")
    }
}
