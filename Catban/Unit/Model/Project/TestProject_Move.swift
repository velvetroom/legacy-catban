import XCTest
@testable import catban

class TestProject_Move:XCTestCase {
    private var project:Project!
    private struct Constants {
        static let originLeft:IndexPath = IndexPath(item:2, section:0)
        static let originRight:IndexPath = IndexPath(item:0, section:2)
        static let destinationSame:IndexPath = IndexPath(item:0, section:0)
        static let destinationDifferent:IndexPath = IndexPath(item:0, section:1)
        static let columnDestination:Int = 1
    }
    
    override func setUp() {
        super.setUp()
        self.project = Project.factoryFirstProject()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.project, "Failed to load project")
    }
    
    func testMoveCardInSameSection() {
        let expectedTitle:String = self.titleAt(index:Constants.originLeft)
        let initialTitle:String = self.titleAt(index:Constants.destinationSame)
        XCTAssertNotEqual(expectedTitle, initialTitle, "Expected and initial titles can't be the same")
        
        self.project.moveCardFrom(origin:Constants.originLeft, to:Constants.destinationSame)
        
        let updatedTitle:String = self.titleAt(index:Constants.destinationSame)
        XCTAssertEqual(expectedTitle, updatedTitle, "Failed to move card to expected index")
    }
    
    func testMoveCardInDifferentSection() {
        let expectedTitle:String = self.titleAt(index:Constants.originLeft)
        
        self.project.moveCardFrom(origin:Constants.originLeft, to:Constants.destinationDifferent)
        
        let updatedTitle:String = self.titleAt(index:Constants.destinationDifferent)
        XCTAssertEqual(expectedTitle, updatedTitle, "Failed to move card to expected index")
    }
    
    func testMoveCardsChangesSize() {
        let originSize:Int = self.sizeOfColumn(index:Constants.originLeft)
        let destinationSize:Int = self.sizeOfColumn(index:Constants.destinationDifferent)
        let expectedOriginSize:Int = originSize - 1
        let expectedDestinationSize:Int = destinationSize + 1
        
        self.project.moveCardFrom(origin:Constants.originLeft, to:Constants.destinationDifferent)
        let updatedOriginSize:Int = self.sizeOfColumn(index:Constants.originLeft)
        let updatedDestinationSize:Int = self.sizeOfColumn(index:Constants.destinationDifferent)
        
        XCTAssertEqual(expectedOriginSize, updatedOriginSize, "Failed to move card")
        XCTAssertEqual(expectedDestinationSize, updatedDestinationSize, "Failed to move card")
    }
    
    func testIndexOnRightForCardWithEmptyColumn() {
        XCTAssertTrue(self.project.columns[Constants.columnDestination].cards.isEmpty, "Column should be empty")
        let expectedIndex:IndexPath = IndexPath(item:0, section:Constants.columnDestination)
        
        let index:IndexPath = self.project.indexOnRightForCardAt(index:Constants.originLeft)
        
        XCTAssertEqual(expectedIndex, index, "Failed to return expected index")
    }
    
    func testIndexOnRightForCardWithNonEmptyColumn() {
        self.project.columns[Constants.columnDestination].cards.append(ProjectCard())
        let countCards:Int = self.project.columns[Constants.columnDestination].cards.count
        XCTAssertFalse(self.project.columns[Constants.columnDestination].cards.isEmpty, "Column should not be empty")
        let expectedIndex:IndexPath = IndexPath(item:countCards, section:Constants.columnDestination)
        
        let index:IndexPath = self.project.indexOnRightForCardAt(index:Constants.originLeft)
        
        XCTAssertEqual(expectedIndex, index, "Failed to return expected index")
    }
    
    func testIndexOnLeftForCardWithEmptyColumn() {
        XCTAssertTrue(self.project.columns[Constants.columnDestination].cards.isEmpty, "Column should be empty")
        let expectedIndex:IndexPath = IndexPath(item:0, section:Constants.columnDestination)
        
        let index:IndexPath = self.project.indexOnLeftForCardAt(index:Constants.originRight)
        
        XCTAssertEqual(expectedIndex, index, "Failed to return expected index")
    }
    
    func testIndexOnLeftForCardWithNonEmptyColumn() {
        self.project.columns[Constants.columnDestination].cards.append(ProjectCard())
        let countCards:Int = self.project.columns[Constants.columnDestination].cards.count
        XCTAssertFalse(self.project.columns[Constants.columnDestination].cards.isEmpty, "Column should not be empty")
        let expectedIndex:IndexPath = IndexPath(item:countCards, section:Constants.columnDestination)
        
        let index:IndexPath = self.project.indexOnLeftForCardAt(index:Constants.originRight)
        
        XCTAssertEqual(expectedIndex, index, "Failed to return expected index")
    }
    
    private func titleAt(index:IndexPath) -> String {
        return self.project.columns[index.section].cards[index.item].title
    }
    
    private func sizeOfColumn(index:IndexPath) -> Int {
        return self.project.columns[index.section].cards.count
    }
}
