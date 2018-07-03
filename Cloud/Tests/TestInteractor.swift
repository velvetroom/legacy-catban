import XCTest
import Board
import Shared
@testable import Cloud

class TestInteractor:XCTestCase {
    private var view:Cloud.View!
    private var repository:MockRepositoryProjectProtocol!
    private var board:MockBoardProtocol!
    private var project:ProjectProtocol!
    
    override func setUp() {
        super.setUp()
        Configuration.repositoryProjectType = MockRepositoryProjectProtocol.self
        self.view = Cloud.View()
        self.repository = MockRepositoryProjectProtocol()
        self.board = MockBoardProtocol()
        self.project = ProjectFactory.newProject()
        self.view.presenter.interactor.repository = self.repository
        self.view.presenter.interactor.board = self.board
        self.view.presenter.interactor.project = self.project
    }
    
    func testNotRetainingPresenter() {
        self.view.presenter.interactor.presenter = Presenter()
        XCTAssertNil(self.view.presenter.interactor.presenter, "Retains")
    }
    
    func testNotRetainingProject() {
        self.view.presenter.interactor.project = ProjectFactory.newProject()
        XCTAssertNil(self.view.presenter.interactor.project, "Retains")
    }
    
    func testRetainingBoard() {
        self.view.presenter.interactor.board = BoardFactory.newBoard()
        XCTAssertNotNil(self.view.presenter.interactor.board, "Retains")
    }
    
    func testStartCloudChangesProjectToSynched() {
        let expectRemoved:XCTestExpectation = self.expectation(description:"Old project not removed")
        let expectAdded:XCTestExpectation = self.expectation(description:"Synched project not added")
        let expectReplaced:XCTestExpectation = self.expectation(description:"Project not replaced")
        self.board.onAdd = { expectAdded.fulfill() }
        self.board.onRemove = { expectRemoved.fulfill() }
        self.view.presenter.interactor.start(onCompletion:{
            let current:ProjectSynchedProtocol? = self.view.presenter.interactor.project as? ProjectSynchedProtocol
            XCTAssertNotNil(current, "Failed to replace current project in interactor")
            XCTAssertEqual(Thread.current, Thread.main, "Should be on main thread")
            expectReplaced.fulfill()
        }, onError:{ (error:Error) in })
        self.waitForExpectations(timeout:0.3, handler:nil)
    }
    
    func testErrorReturnsOnMainThread() {
        let expect:XCTestExpectation = self.expectation(description:"Failed to return with error")
        self.repository.error = NSError(domain:String(), code:0, userInfo:nil)
        self.view.presenter.interactor.start(onCompletion:{}) { (error:Error) in
            XCTAssertEqual(Thread.current, Thread.main, "Should be on main thread")
            expect.fulfill()
        }
        self.waitForExpectations(timeout:0.3, handler:nil)
    }
    
    func testStartCloudSavesSynchedProject() {
        let expect:XCTestExpectation = self.expectation(description:"Not saved")
        MockRepositoryProjectProtocol.onSave = { expect.fulfill() }
        self.view.presenter.interactor.start(onCompletion: { }, onError: { (error:Error) in })
        self.waitForExpectations(timeout:0.3, handler:nil)
    }
}
