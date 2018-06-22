import XCTest
import Shared
import Board
@testable import Load

class TestInteractor:XCTestCase {
    private var interactor:Interactor!
    private var view:Load.View!
    
    override func setUp() {
        super.setUp()
        Configuration.repositoryBoardType = MockRepositoryBoardProtocol.self
        Configuration.repositoryProjectType = MockRepositoryProjectProtocol.self
        MockRepositoryBoardProtocol.error = nil
        self.view = Load.View()
        self.interactor = view.presenter.interactor
    }
    
    func testLoadBoard() {
        let expect:XCTestExpectation = self.expectation(description:"Waiting for board loaded")
        MockRepositoryBoardProtocol.onLoadBoard = {
            XCTAssertFalse(Thread.isMainThread, "Should not be called on main thread")
            MockRepositoryBoardProtocol.onLoadBoard = nil
            expect.fulfill()
        }
        
        self.interactor.didLoad()
        self.waitForExpectations(timeout:0.3, handler:nil)
    }
    
    func testSaveFactoredBoard() {
        let expect:XCTestExpectation = self.expectation(description:"Waiting for save board")
        MockRepositoryBoardProtocol.error = NSError(domain:String(), code:0)
        MockRepositoryBoardProtocol.onSaveBoard = { (board:BoardProtocol) in
            MockRepositoryBoardProtocol.onSaveBoard = nil
            MockRepositoryBoardProtocol.error = nil
            expect.fulfill()
        }
        
        self.interactor.didLoad()
        self.waitForExpectations(timeout:0.3, handler:nil)
    }
    
    func testSaveFactoredProject() {
        let expect:XCTestExpectation = self.expectation(description:"Waiting for save board")
        MockRepositoryBoardProtocol.error = NSError(domain:String(), code:0)
        MockRepositoryProjectProtocol.onSave = {
            MockRepositoryBoardProtocol.error = nil
            MockRepositoryProjectProtocol.onSave = nil
            expect.fulfill()
        }
        
        self.interactor.didLoad()
        self.waitForExpectations(timeout:0.3, handler:nil)
    }
}
