import XCTest
@testable import catban

class TestCollectionUpdateSalvageItemFromDeletion:XCTestCase {
    private var update:CollectionUpdateSalvageItemFromDeletion!
    private var view:MockLandingViewCollection!
    private var board:MockBoardProtocol!
    private var project:MockProjectProtocol!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let origin:IndexPath = IndexPath(item:2313, section:85413)
        static let destinationBeforeUpdate:IndexPath = IndexPath(item:645, section:2423)
        static let destinationAfterUpdate:IndexPath = IndexPath(item:245, section:4568)
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.update = CollectionUpdateSalvageItemFromDeletion()
        self.view = MockLandingViewCollection()
        self.board = MockBoardProtocol()
        self.project = MockProjectProtocol()
        self.board.project = self.project
        self.update.origin = Constants.origin
        self.update.destinationBeforeUpdate = Constants.destinationBeforeUpdate
        self.update.destinationAfterUpdate = Constants.destinationAfterUpdate
    }
    
    func testLoad() {
        XCTAssertNotNil(self.update, "Failed to load update")
        XCTAssertNotNil(self.update.origin, "Failed to load origin")
        XCTAssertNotNil(self.update.destinationBeforeUpdate, "Failed to load destination before update")
        XCTAssertNotNil(self.update.destinationAfterUpdate, "Failed to load destination after update")
        XCTAssertNotNil(self.board, "Failed to load board")
        XCTAssertNotNil(self.project, "Failed to load project")
        XCTAssertNotNil(self.view, "Failed to load view")
    }
    
    func testStrategyCollection() {
        self.startExpectation()
        self.view.onMoveItem = { [weak self] (origin:IndexPath, destination:IndexPath) in
            XCTAssertEqual(origin, Constants.origin, "Invalid origin")
            XCTAssertEqual(destination, Constants.destinationAfterUpdate, "Invalid destination")
            self?.expect?.fulfill()
        }
        
        self.update.strategy(collectionView:self.view)
        
        self.waitExpectation()
    }
    
    func testStrategyProject() {
        self.startExpectation()
        self.project.onMoveCard = { [weak self] (origin:IndexPath, destination:IndexPath) in
            XCTAssertEqual(origin, Constants.origin, "Invalid origin")
            XCTAssertEqual(destination, Constants.destinationBeforeUpdate, "Invalid destination")
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
