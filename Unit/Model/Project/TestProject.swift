import XCTest
@testable import catban

class TestProject:XCTestCase {
    private var project:Project!
    private struct Constants {
        static let indexPath:IndexPath = IndexPath(item:1, section:0)
    }
    
    override func setUp() {
        super.setUp()
        self.project = Project.factoryNewProject()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.project, "Failed to load project")
        XCTAssertNotNil(self.project.columns, "Failed to load columns")
        XCTAssertNotNil(self.project.name, "Project has not name")
    }
    
    func testCardAtIndexPath() {
        let card:ProjectCard = self.project.cardAt(indexPath:Constants.indexPath)
        let compareCard:ProjectCard = self.project.columnAt(index:Constants.indexPath.section).cards[
            Constants.indexPath.item]
        
        XCTAssertTrue(card === compareCard, "Incorrect card returned")
    }
}
