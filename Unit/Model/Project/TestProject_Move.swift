import XCTest
@testable import catban

class TestProject_Move:XCTestCase {
    private var project:Project!
    private struct Constants {
        static let cardIndex:Int = 2
        static let destinationIndex:Int = 0
        static let columnIndex:Int = 0
    }
    
    override func setUp() {
        super.setUp()
        self.project = Project.factoryNewProject()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.project, "Failed to load project")
    }
    
    func testMoveCardInSameSection() {
        let expectedTitle:String = self.titleAt(card:Constants.cardIndex, column:Constants.columnIndex)
        let initialTitle:String = self.titleAt(card:Constants.destinationIndex, column:Constants.columnIndex)
        XCTAssertNotEqual(expectedTitle, initialTitle, "Expected and initial titles can't be the same")
        
        self.project.move(cardIndex:Constants.cardIndex, to:Constants.destinationIndex, in:Constants.columnIndex)
        
        let updatedTitle:String = self.titleAt(card:Constants.destinationIndex, column:Constants.columnIndex)
        XCTAssertEqual(expectedTitle, updatedTitle, "Failed to move card to expected index")
    }
    
    private func titleAt(card:Int, column:Int) -> String {
        return self.project.columns[column].cards[card].title
    }
}
