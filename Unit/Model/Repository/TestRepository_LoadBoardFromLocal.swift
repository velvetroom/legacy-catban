import XCTest
@testable import catban

class TestRepository_LoadBoardFromLocal:XCTestCase {
    private var model:Repository!
    private var local:MockRepositoryLocalProtocol!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.model = Repository()
        self.local = MockRepositoryLocalProtocol()
        self.model.local = self.local
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.local, "Failed to load local")
    }
    
    func testLoadBoardFromLocal() {
        self.startExpectation()
        self.local.onLoadBoard = { [weak self] in
            self?.expect?.fulfill()
        }
        
        do { let _:BoardProtocol = try self.model.loadBoard() } catch { }
        
        self.waitExpectations()
    }
    
    func testNoThrows() {
        XCTAssertNoThrow(try self.model.loadBoard(), "Failed to load board")
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectations() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
