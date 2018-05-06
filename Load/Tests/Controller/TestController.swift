import XCTest
@testable import Load
@testable import Shared
@testable import Board

class TestController:XCTestCase {
    private var controller:Controller!
    private var repository:MockRepositoryBoardProtocol!
    private var transition:MockTransitionProtocol!
    
    override func setUp() {
        super.setUp()
        Configuration.repositoryBoardType = MockRepositoryBoardProtocol.self
        self.controller = Controller()
        self.transition = MockTransitionProtocol()
        self.repository = self.controller.repository as? MockRepositoryBoardProtocol
        self.controller.transiton = self.transition
    }
    
    func testLoad() {
        XCTAssertNotNil(self.controller, "Failed to load controller")
        XCTAssertNotNil(self.controller.presenter.delegate, "Failed to assign delegate")
        XCTAssertNotNil(self.controller.dispatchQueue, "Failed to load dispatch queue")
        XCTAssertNotNil(self.controller.repository, "Failed to load repository")
        XCTAssertNotNil(self.transition, "Failed to load transition")
    }
    
    func testLoadBoard() {
        let expect:XCTestExpectation = expectation(description:"Waiting for board loaded")
        self.repository.onLoadBoard = {
            XCTAssertFalse(Thread.isMainThread, "Should not be called on main thread")
            expect.fulfill()
        }
        
        self.controller.didLoadPresenter()
        self.waitForExpectations(timeout:0.1, handler:nil)
    }
    
    func testSaveFactoredBoard() {
        let expect:XCTestExpectation = expectation(description:"Waiting for save board")
        self.repository.error = NSError(domain:String(), code:0)
        self.repository.onSaveBoard = { (board:BoardProtocol) in
            expect.fulfill()
        }
        
        self.controller.didLoadPresenter()
        self.waitForExpectations(timeout:0.1, handler:nil)
    }
    
    func testBoardLoadedTransitionsToHome() {
        let expect:XCTestExpectation = expectation(description:"Waiting transition")
        self.transition.onTransitionToHome = {
            XCTAssertTrue(Thread.isMainThread, "Should be on main thread")
            expect.fulfill()
        }
        
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async { [weak self] in
            self?.controller.boardLoaded(board:BoardFactory.newBoard())
        }
        self.waitForExpectations(timeout:0.1, handler:nil)
    }
}
