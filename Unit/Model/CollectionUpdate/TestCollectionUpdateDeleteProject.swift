import XCTest
@testable import catban

class TestCollectionUpdateDeleteProject:XCTestCase {
    private var update:CollectionUpdateDeleteProject!
    private var board:MockBoardProtocol!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.update = CollectionUpdateDeleteProject()
        self.board = MockBoardProtocol()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.update, "Failed to load update")
        XCTAssertNotNil(self.board, "Failed to load board")
    }
    
    func testStrategyBoardInsertsProject() {
        self.startExpectation()
        self.board.onDeleteProject = { [weak self] in
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
