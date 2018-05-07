import XCTest
@testable import Board

class TestProjectFactory_Kanban:XCTestCase {
    private var model:ProjectProtocol!
    private struct Constants {
        static let expectedColumns:Int = 3
        static let expectedCards:Int = 2
    }
    
    override func setUp() {
        super.setUp()
        self.model = ProjectFactory.newKanbanProject()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
    }
    
    func testProjectName() {
        XCTAssertFalse(self.model.name.isEmpty, "Project name should not be empty")
    }
    
    func testNumberOfColumns() {
        XCTAssertEqual(self.model.countColumns, Constants.expectedColumns, "Invalid number of columns")
    }
    
    func testNumberOfCards() {
        var counter:Int = 0
        let countColumns:Int = self.model.countColumns
        for index:Int in 0 ..< countColumns {
            let column:ColumnProtocol = self.model.columnAt(index:index)
            counter += column.countCards
        }
        XCTAssertEqual(counter, Constants.expectedCards, "Invalid number of expected cards")
    }
    
    func testColumnTitles() {
        let countColumns:Int = self.model.countColumns
        for index:Int in 0 ..< countColumns {
            let column:ColumnProtocol = self.model.columnAt(index:index)
            XCTAssertFalse(column.name.isEmpty, "Column should have a name assigned")
        }
    }
    
    func testCardsContent() {
        let countColumns:Int = self.model.countColumns
        for indexColumn:Int in 0 ..< countColumns {
            let column:ColumnProtocol = self.model.columnAt(index:indexColumn)
            let countCards:Int = column.countCards
            for indexCard:Int in 0 ..< countCards {
                let card:CardProtocol = column.cardAt(index:indexCard)
                XCTAssertFalse(card.content.isEmpty, "Card content should not be empty")
            }
        }
    }
}
