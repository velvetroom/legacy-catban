import XCTest
@testable import Template
@testable import Board

class TestKanbanFactory:XCTestCase {
    private var model:ProjectProtocol!
    private struct Constants {
        static let totalColumns:Int = 3
        static let totalCards:Int = 2
    }
    
    override func setUp() {
        super.setUp()
        self.model = KanbanFactory.newProject()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
    }
    
    func testProjectName() {
        XCTAssertFalse(self.model.name.isEmpty, "Project should have a name")
    }
    
    func testTotalColumns() {
        XCTAssertEqual(self.model.countColumns, Constants.totalColumns, "Invalid number of columns")
    }
    
    func testColumnTitles() {
        self.model.iterate { (column:ColumnProtocol) in
            XCTAssertFalse(column.name.isEmpty, "Name not set for column")
        }
    }
    
    func testTotalCards() {
        XCTAssertEqual(self.model.countCards, Constants.totalCards, "Invalid number of cards")
    }
    
    func testCardContent() {
        self.model.iterate { (column:ColumnProtocol) in
            column.iterate { (card:CardProtocol) in
                XCTAssertFalse(card.content.isEmpty, "Card has no content")
            }
        }
    }
}
