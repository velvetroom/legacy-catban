import XCTest
@testable import catban

class TestLoad:XCTestCase {
    private var model:Load!
    private var repository:MockRepositoryProtocol!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.model = Load()
        self.repository = MockRepositoryProtocol()
        self.model.repository = self.repository
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.model.repository, "Failed to load repository")
        XCTAssertNotNil(self.model.dispatchQueue, "Failed to load dispatch queue")
        XCTAssertEqual(self.model.dispatchQueue.qos, DispatchQoS.background, "Invalid quality of service")
    }
    
    func testLoadBoard() {
        self.startExpectation()
        
        self.model.loadBoard { [weak self] (board:BoardProtocol) in
            XCTAssertTrue(Thread.isMainThread, "Invalid thread on return")
            self?.expect?.fulfill()
        }
        
        self.waitExpectations()
    }
    
    func testBackgroundLoadThread() {
        self.startExpectation()
        self.repository.onLoadBoardFromLocal = { [weak self] in
            self?.expect?.fulfill()
        }
        
        let _:BoardProtocol = self.model.backgroundLoadBoard()
        
        self.waitExpectations()
    }
    
    func testCreateNewBoard() {
        self.startExpectation()
        var userIdentifier:String?
        self.repository.onLocalSave = { [weak self] (board:BoardProtocol) in
            userIdentifier = board.user.identifier
            self?.expect?.fulfill()
        }
        let board:BoardProtocol = self.model.createNewBoard()
        XCTAssertFalse(board.user.identifier.isEmpty, "Failed to factory new board")
        
        self.waitExpectations()
        XCTAssertEqual(board.user.identifier, userIdentifier, "Invalid board received")
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectations() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
