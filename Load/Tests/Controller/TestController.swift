import XCTest
@testable import Load
@testable import Shared
@testable import Board

class TestController:XCTestCase {
    private var controller:Controller!
    private var transition:MockTransitionProtocol!
    
    override func setUp() {
        super.setUp()
        Configuration.repositoryBoardType = MockRepositoryBoardProtocol.self
        Configuration.repositoryProjectType = MockRepositoryProjectProtocol.self
        Configuration.templateFactory = MockTemplateFactory.self
        MockRepositoryBoardProtocol.error = nil
        self.controller = Controller()
        self.transition = MockTransitionProtocol()
        self.controller.transiton = self.transition
    }
    
    func testLoadBoard() {
        let expect:XCTestExpectation = expectation(description:"Waiting for board loaded")
        MockRepositoryBoardProtocol.onLoadBoard = {
            XCTAssertFalse(Thread.isMainThread, "Should not be called on main thread")
            MockRepositoryBoardProtocol.onLoadBoard = nil
            expect.fulfill()
        }
        
        self.controller.didLoadPresenter()
        self.waitForExpectations(timeout:0.3, handler:nil)
    }
    
    func testFactoredBoardFromTemplate() {
        let expect:XCTestExpectation = expectation(description:"Waiting for save board")
        MockRepositoryBoardProtocol.error = NSError(domain:String(), code:0)
        DispatchQueue.main.asyncAfter(deadline:DispatchTime.now() + 0.3) {
            XCTAssertTrue(MockTemplateFactory.templateCalled, "Template factory not used")
            MockRepositoryBoardProtocol.error = nil
            expect.fulfill()
        }
        
        MockTemplateFactory.templateCalled = false
        self.controller.didLoadPresenter()
        self.waitForExpectations(timeout:0.3, handler:nil)
    }
    
    func testSaveFactoredBoard() {
        let expect:XCTestExpectation = expectation(description:"Waiting for save board")
        MockRepositoryBoardProtocol.error = NSError(domain:String(), code:0)
        MockRepositoryBoardProtocol.onSaveBoard = { (board:BoardProtocol) in
            MockRepositoryBoardProtocol.onSaveBoard = nil
            MockRepositoryBoardProtocol.error = nil
            expect.fulfill()
        }
        
        self.controller.didLoadPresenter()
        self.waitForExpectations(timeout:0.3, handler:nil)
    }
    
    func testSaveFactoredProject() {
        let expect:XCTestExpectation = expectation(description:"Waiting for save board")
        MockRepositoryBoardProtocol.error = NSError(domain:String(), code:0)
        MockRepositoryProjectProtocol.onSave = {
            MockRepositoryBoardProtocol.error = nil
            MockRepositoryProjectProtocol.onSave = nil
            expect.fulfill()
        }
        
        self.controller.didLoadPresenter()
        self.waitForExpectations(timeout:0.3, handler:nil)
    }
    
    func testTransitionIsNotRetained() {
        self.controller.transiton = MockTransitionProtocol()
        XCTAssertNil(self.controller.transiton, "Strong retained")
    }
}
