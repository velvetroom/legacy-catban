import XCTest
@testable import Board

class TestCardFactory:XCTestCase {
    func testNewCardIdentifier() {
        let card:CardProtocol = CardFactory.newCard()
        XCTAssertFalse(card.identifier.isEmpty, "Failed to assign identifier")
    }
    
    func testNewCardCreated() {
        let timestamp:Int = Date.timestamp
        let card:CardProtocol = CardFactory.newCard()
        XCTAssertGreaterThanOrEqual(card.created, timestamp, "Failed to assign created")
    }
}
