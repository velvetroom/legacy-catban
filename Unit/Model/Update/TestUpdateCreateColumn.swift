import XCTest
@testable import catban

class TestUpdateCreateColumn:XCTestCase {
    private var update:UpdateCreateColumn!
    private var view:MockLandingViewCollection!
    private var project:MockProjectProtocol!
    private var board:Board!
    private var column:ProjectColumn!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
        static let section:Int = 456765
    }
    
    override func setUp() {
        super.setUp()
        self.update = UpdateCreateColumn()
        self.view = MockLandingViewCollection()
        self.board = Board()
        self.project = MockProjectProtocol()
        self.board.project = self.project
        self.column = self.update.column
        self.update.section = Constants.section
    }
    
    func testLoad() {
        XCTAssertNotNil(self.update, "Failed to load update")
        XCTAssertNotNil(self.update.section, "Failed top load section")
        XCTAssertNotNil(self.update.column, "Failed to load column")
        XCTAssertNotNil(self.board, "Failed to load board")
        XCTAssertNotNil(self.project, "Failed to load project")
        XCTAssertNotNil(self.view, "Failed to load view")
    }
    
    func testIdentifier() {
        XCTAssertFalse(self.column.identifier.isEmpty, "Failed to create identifier for column")
    }
    
    func testStrategyCollection() {
        self.startExpectation()
        self.view.onInsertSections = { [weak self] (sections:IndexSet) in
            XCTAssertEqual(sections.first, Constants.section, "Invalid section")
            self?.expect?.fulfill()
        }
        
        self.update.strategy(collectionView:self.view)
        
        self.waitExpectation()
    }
    
    func testStrategyBoard() {
        self.startExpectation()
        self.project.onInsertColumnAt = { [weak self] (column:ProjectColumn, index:Int) in
            XCTAssertTrue(column === self?.column, "Invalid column")
            XCTAssertEqual(index, Constants.section, "Invalid index")
            self?.expect?.fulfill()
        }
        
        self.update.strategy(board:self.board)
        
        self.waitExpectation()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectation() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
