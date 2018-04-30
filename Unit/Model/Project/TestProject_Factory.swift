import XCTest
@testable import catban

class TestProject_Factory:XCTestCase {
    private var project:Project!
    
    override func setUp() {
        super.setUp()
        self.project = Project.factoryFirstProject()
    }
    
    func testFactory() {
        XCTAssertNotNil(self.project, "Failed to factorise new project")
        XCTAssertFalse(self.project.name.isEmpty, "Failed to assign default name")
        XCTAssertFalse(self.project.columns.isEmpty, "Failed to assign default columns")
        XCTAssertFalse(self.project.identifier.isEmpty, "Failed to assign identifier")
    }
    
    func testFactoryColumns() {
        let columns:[ProjectColumn] = Project.factoryDefaultColumns()
        XCTAssertNotNil(columns, "Failed to factory columns")
        for column:ProjectColumn in columns {
            XCTAssertFalse(column.identifier.isEmpty, "Failed to assign identifier")
            XCTAssertFalse(column.name.isEmpty, "Failed to assign name")
        }
    }
    
    func testFactoryCards() {
        for column:ProjectColumn in self.project.columns {
            for card:ProjectCard in column.cards {
                XCTAssertFalse(card.title.isEmpty, "Failed to assign title")
                XCTAssertFalse(card.identifier.isEmpty, "Failed to assign identifier")
            }
        }
    }
    
    func testFactoryHistory() {
        var totalCards:Int = 0
        for column:ProjectColumn in self.project.columns {
            totalCards += column.cards.count
        }
        let history:HistoryProtocol = self.project.history
        XCTAssertEqual(history.items.count, totalCards, "There should be 1 history item per card")
    }
    
    func testFactoryTotalCards() {
        var totalCards:Int = 0
        for column:ProjectColumn in self.project.columns {
            totalCards += column.cards.count
        }
        XCTAssertGreaterThan(totalCards, 0, "There is no card on project")
    }
}
