import XCTest
@testable import catban

class TestRepository_SaveBoardToLocal:XCTestCase {
    private var model:Repository!
    private var local:MockRepositoryLocalProtocol!
    private var board:Board!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.model = Repository()
        self.local = MockRepositoryLocalProtocol()
        self.board = Board()
        self.model.local = self.local
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.local, "Failed to load local")
        XCTAssertNotNil(self.board, "Failed to load board")
    }
    
    func testSaveBoardToLocal() {
        self.startExpectation()
        self.local.onSaveBoard = { [weak self] (board:BoardProtocol) in
            let received:Board? = board as? Board
            XCTAssertNotNil(received, "Invalid board received")
            XCTAssertTrue(received === self?.board, "Invalid board received")
            self?.expect?.fulfill()
        }
        
        do { try self.model.localSave(board:self.board) } catch { }
        
        self.waitExpectations()
    }
    
    func testLoadBoardFromLocal() {
        self.startExpectation()
        self.local.onLoadBoard = { [weak self] in
            self?.expect?.fulfill()
        }
        
        do {
            let _:BoardProtocol = try self.model.loadBoardFromLocal()
        } catch { }
        
        self.waitExpectations()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectations() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
