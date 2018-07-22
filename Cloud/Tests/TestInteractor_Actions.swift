import XCTest
import Board
import Shared
@testable import Cloud

class TestInteractor_Actions:XCTestCase {
    private var view:Cloud.View!
    private var repository:MockRepositoryProjectProtocol!
    private var board:MockBoardProtocol!
    private var project:ProjectSynchedProtocol!
    
    override func setUp() {
        super.setUp()
        Configuration.repositoryProjectType = MockRepositoryProjectProtocol.self
        self.view = Cloud.View()
        self.repository = MockRepositoryProjectProtocol()
        self.board = MockBoardProtocol()
        let original:ProjectProtocol = ProjectFactory.newProject()
        self.project = ProjectFactory.makeSynchable(project:original)
        self.view.presenter.interactor.repository = self.repository
        self.view.presenter.interactor.board = self.board
        self.view.presenter.interactor.project = self.project
    }
    
    func testSavesRemoteProject() {
        let expect:XCTestExpectation = self.expectation(description:"Not saved")
        self.repository.onRemoteSave = { expect.fulfill() }
        self.view.presenter.interactor.save(onCompletion: { }, onError: { (error:Error) in })
        self.waitForExpectations(timeout:0.3, handler:nil)
    }
    
    func testSavesLocalProject() {
        let expect:XCTestExpectation = self.expectation(description:"Not saved")
        self.repository.onLocalSave = { expect.fulfill() }
        self.view.presenter.interactor.save(onCompletion: { }, onError: { (error:Error) in })
        self.waitForExpectations(timeout:0.3, handler:nil)
    }
    
    func testSaveSuccessReturnsOnMainThread() {
        let expect:XCTestExpectation = self.expectation(description:"Failed to return with error")
        self.view.presenter.interactor.save(onCompletion: {
            XCTAssertEqual(Thread.current, Thread.main, "Should be on main thread")
            expect.fulfill()
        } ) { (error:Error) in }
        self.waitForExpectations(timeout:0.3, handler:nil)
    }
    
    func testSaveErrorReturnsOnMainThread() {
        let expect:XCTestExpectation = self.expectation(description:"Failed to return with error")
        self.repository.error = NSError(domain:String(), code:0, userInfo:nil)
        self.view.presenter.interactor.save(onCompletion: { } ) { (error:Error) in
            XCTAssertEqual(Thread.current, Thread.main, "Should be on main thread")
            expect.fulfill()
        }
        self.waitForExpectations(timeout:0.3, handler:nil)
    }
}
