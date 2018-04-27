import XCTest
@testable import catban

class TestProject:XCTestCase {
    private var project:Project!
    private var totalCards:Int {
        get {
            var counter:Int = 0
            for column:ProjectColumn in self.project.columns {
                counter += column.cards.count
            }
            return counter
        }
    }
    
    private struct Constants {
        static let indexPath:IndexPath = IndexPath(item:1, section:0)
        static let columnIndex:Int = 1
    }
    
    override func setUp() {
        super.setUp()
        self.project = Project.factoryFirstProject()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.project, "Failed to load project")
        XCTAssertNotNil(self.project.columns, "Failed to load columns")
        XCTAssertNotNil(self.project.name, "Project has not name")
        XCTAssertNotNil(self.project.identifier, "Failed to load identifier")
        XCTAssertNotNil(self.project.history, "Failed to load history")
    }
    
    func testCardAtIndexPath() {
        let card:ProjectCard = self.project.cardAt(indexPath:Constants.indexPath)
        let compareCard:ProjectCard = self.project.columnAt(index:Constants.indexPath.section).cards[
            Constants.indexPath.item]
        
        XCTAssertTrue(card === compareCard, "Incorrect card returned")
    }
    
    func testColumnAtIndex() {
        let expectedColumn:ProjectColumn = self.project.columns[Constants.columnIndex]
        let column:ProjectColumn = self.project.columnAt(index:Constants.columnIndex)
        
        XCTAssertTrue(expectedColumn === column, "Invalid column returned")
    }
    
    func testIndexForColumn() {
        let column:ProjectColumn = self.project.columns[Constants.columnIndex]
        let index:Int = self.project.indexFor(column:column)
        XCTAssertEqual(index, Constants.columnIndex, "Invalid index returned")
    }
    
    func testTotalCards() {
        let totalCards:Int = self.project.totalCards
        XCTAssertEqual(totalCards, self.totalCards, "Invalid total cards")
    }
}
