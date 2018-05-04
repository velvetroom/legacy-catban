import XCTest
@testable import Load
@testable import Shared
@testable import Board

class TestController:XCTestCase {
    private var controller:Controller!
    private var repository:MockRepositoryBoardProtocol!
    
    override func setUp() {
        super.setUp()
        Configuration.repositoryBoardType = MockRepositoryBoardProtocol.self
        self.controller = Controller()
        self.repository = self.controller.repository as? MockRepositoryBoardProtocol
    }
    
    func testLoad() {
        XCTAssertNotNil(self.controller, "Failed to load controller")
        XCTAssertNotNil(self.controller.presenter.delegate, "Failed to assign delegate")
        XCTAssertNotNil(self.controller.dispatchQueue, "Failed to load dispatch queue")
        XCTAssertNotNil(self.controller.repository, "Failed to load repository")
    }
    
    func testLoadBoard() {
        let expect:XCTestExpectation = expectation(description:"Waiting for board called")
        self.repository.onLoadBoard = {
            XCTAssertFalse(Thread.isMainThread, "Should not be called on main thread")
            expect.fulfill()
        }
        
        self.controller.viewDidLoad()
        self.waitForExpectations(timeout:0.1, handler:nil)
    }
    
    func testSaveFactoredBoard() {
        let expect:XCTestExpectation = expectation(description:"Waiting for board called")
        self.repository.error = NSError(domain:String(), code:0)
        self.repository.onSaveBoard = { (board:BoardProtocol) in
            expect.fulfill()
        }
        
        self.controller.viewDidLoad()
        self.waitForExpectations(timeout:0.1, handler:nil)
    }
}
