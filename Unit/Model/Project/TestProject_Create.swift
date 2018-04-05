import XCTest
@testable import catban

class TestProject_Create:XCTestCase {
    private var project:Project!
    
    override func setUp() {
        super.setUp()
        self.project = Project()
        self.configureProject()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.project, "Failed to load project")
    }
    
    func testIndexForNewCard() {
        let expectedIndex:IndexPath = IndexPath(item:self.project.columnAt(index:0).cards.count, section:0)
        let index:IndexPath = self.project.indexForNewCard()
        XCTAssertEqual(index, expectedIndex, "Invalid index for card")
    }
    
    private func configureProject() {
        let card:ProjectCard = ProjectCard()
        let columnA:ProjectColumn = ProjectColumn()
        columnA.cards.append(card)
        let columnB:ProjectColumn = ProjectColumn()
        self.project.columns.append(columnA)
        self.project.columns.append(columnB)
    }
    
    func testInsertCardAtIndex() {
        let card:ProjectCard = ProjectCard()
        let index:IndexPath = IndexPath(item:1, section:0)
        self.project.insert(card:card, at:index)
        XCTAssertTrue(self.project.cardAt(indexPath:index) === card, "Failed to insert card")
    }
}
