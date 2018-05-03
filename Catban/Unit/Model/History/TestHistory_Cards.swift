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
        let card:ProjectCard = ProjectCard.factoryCard()
        
        self.model.created(card:card)
        
        let item:HistoryItemCreateCard? = self.model.items.first as? HistoryItemCreateCard
        XCTAssertEqual(self.model.items.count, 1, "Failed to add item")
        XCTAssertNotNil(item, "Invalid item type created")
        XCTAssertEqual(item?.cardIdentifier, card.identifier, "Failed to assign card to item")
    }
    
    func testMoveCard() {
        let card:ProjectCard = ProjectCard.factoryCard()
        let column:ProjectColumn = ProjectColumn.factoryColumn()
        
        self.model.moved(card:card, to:column)
        
        let item:HistoryItemMoveCard? = self.model.items.first as? HistoryItemMoveCard
        XCTAssertEqual(self.model.items.count, 1, "Failed to add item")
        XCTAssertNotNil(item, "Invalid item type created")
        XCTAssertEqual(item?.cardIdentifier, card.identifier, "Failed to assign card identifier")
        XCTAssertEqual(item?.columnIdentifier, column.identifier, "Failed to assign column identifier")
    }
}
