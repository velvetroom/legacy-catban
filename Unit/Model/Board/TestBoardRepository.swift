import XCTest
@testable import catban

class TestBoardRepository:XCTestCase {
    private var model:BoardRepository!
    private var board:Board!
    private var repository:MockRepositoryProtocol!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.model = BoardRepository()
        self.repository = MockRepositoryProtocol()
        self.board = Board()
        self.model.repository = self.repository
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.repository, "Failed to load repository")
        XCTAssertNotNil(self.board, "Failed to load board")
        XCTAssertNotNil(self.model.dispatchQueue, "Failed to load queue")
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectation() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
