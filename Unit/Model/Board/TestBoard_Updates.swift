import XCTest
@testable import catban

class TestBoard_Updates:XCTestCase {
    private var board:Board!
    private var update:MockUpdateProtocol!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.board = Board()
        self.update = MockUpdateProtocol()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.board, "Failed to load board")
        XCTAssertNotNil(self.update, "Failed to load update")
    }
    
    func testStrategyUpdates() {
        self.startExpectation()
        self.update.onStrategyBoard = { [weak self] (board:BoardProtocol) in
            guard
                let board:Board = board as? Board
            else { return }
            XCTAssertTrue(board === self?.board, "Invalid board received")
            self?.expect?.fulfill()
        }
        
        self.board.apply(updates:[self.update])
        
        self.waitExpectation()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectation() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
