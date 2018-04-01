import XCTest
@testable import catban

class TestProject_Move:XCTestCase {
    private var project:Project!
    private struct Constants {
        static let origin:IndexPath = IndexPath(item:2, section:0)
        static let destinationSame:IndexPath = IndexPath(item:0, section:0)
        static let destinationDifferent:IndexPath = IndexPath(item:0, section:1)
    }
    
    override func setUp() {
        super.setUp()
        self.project = Project.factoryNewProject()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.project, "Failed to load project")
    }
    
    func testMoveCardInSameSection() {
        let expectedTitle:String = self.titleAt(index:Constants.origin)
        let initialTitle:String = self.titleAt(index:Constants.destinationSame)
        XCTAssertNotEqual(expectedTitle, initialTitle, "Expected and initial titles can't be the same")
        
        self.project.moveCardFrom(origin:Constants.origin, to:Constants.destinationSame)
        
        let updatedTitle:String = self.titleAt(index:Constants.destinationSame)
        XCTAssertEqual(expectedTitle, updatedTitle, "Failed to move card to expected index")
    }
    
    func testMoveCardInDifferentSection() {
        let expectedTitle:String = self.titleAt(index:Constants.origin)
        
        self.project.moveCardFrom(origin:Constants.origin, to:Constants.destinationDifferent)
        
        let updatedTitle:String = self.titleAt(index:Constants.destinationDifferent)
        XCTAssertEqual(expectedTitle, updatedTitle, "Failed to move card to expected index")
    }
    
    func testMoveCardsChangesSize() {
        let originSize:Int = self.sizeOfColumn(index:Constants.origin)
        let destinationSize:Int = self.sizeOfColumn(index:Constants.destinationDifferent)
        
        self.project.moveCardFrom(origin:Constants.origin, to:Constants.destinationDifferent)
        let expectedOriginSize:Int = originSize - 1
        let expectedDestinationSize:Int = destinationSize + 1
        let updatedOriginSize:Int = self.sizeOfColumn(index:Constants.origin)
        let updatedDestinationSize:Int = self.sizeOfColumn(index:Constants.destinationDifferent)
        
        XCTAssertEqual(expectedOriginSize, updatedOriginSize, "Failed to move card")
        XCTAssertEqual(expectedDestinationSize, updatedDestinationSize, "Failed to move card")
    }
    
    private func titleAt(index:IndexPath) -> String {
        return self.project.columns[index.section].cards[index.item].title
    }
    
    private func sizeOfColumn(index:IndexPath) -> Int {
        return self.project.columns[index.section].cards.count
    }
}
