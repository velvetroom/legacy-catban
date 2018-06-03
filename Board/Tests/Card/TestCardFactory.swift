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
    
    func testBlankCardNoIdentifier() {
        let card:CardProtocol = CardFactory.blankCard()
        XCTAssertTrue(card.identifier.isEmpty, "Card should have no identifier")
    }
    
    func testBlankCardNoCreated() {
        let card:CardProtocol = CardFactory.blankCard()
        XCTAssertEqual(card.created, 0, "Card should have no created")
    }
    
    func testBlankCardNoContent() {
        let card:CardProtocol = CardFactory.blankCard()
        XCTAssertTrue(card.content.isEmpty, "Card should have no content")
    }
}
