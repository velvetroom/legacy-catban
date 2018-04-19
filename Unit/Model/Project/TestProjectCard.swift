import XCTest
@testable import catban

class TestProjectCard:XCTestCase {
    private var card:ProjectCard!
    
    override func setUp() {
        super.setUp()
        self.card = ProjectCard()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.card, "Failed to load card")
        XCTAssertNotNil(self.card.title, "Failed to load title")
        XCTAssertNotNil(self.card.identifier, "Failed to load identifier")
    }
}
