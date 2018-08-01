import XCTest
@testable import Domain

class TestsLibrary:XCTestCase {
    private var library:Library!
    private var delegate:MockLibraryDelegate!
    private var repository:MockRepositoryProtocol!
    
    override func setUp() {
        super.setUp()
        Configuration.repositoryType = MockRepositoryProtocol.self
        self.library = Library()
        self.delegate = MockLibraryDelegate()
        self.library.delegate = self.delegate
        self.repository = self.library.repository as? MockRepositoryProtocol
    }
    
    func testSessionStartsWithNullObject() {
        let sessionNil:SessionNil? = self.library.session as? SessionNil
        XCTAssertNotNil(sessionNil, "Session is not the null object")
    }
    
    func testLoadUpdatesSession() {
        let expect:XCTestExpectation = self.expectation(description:"Not loaded")
        self.delegate.onSessionLoaded = {
            let sessionNil:SessionNil? = self.library.session as? SessionNil
            XCTAssertNil(sessionNil, "Session not loaded")
            XCTAssertEqual(Thread.current, Thread.main, "Not main thread")
            expect.fulfill()
        }
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async { self.library.loadSession() }
        self.waitForExpectations(timeout:0.3, handler:nil)
    }
    
    func testLoadCreatesSessionOnError() {
        let expectLoad:XCTestExpectation = self.expectation(description:"Not loaded")
        let expectSave:XCTestExpectation = self.expectation(description:"Not saved")
        self.repository.error = NSError()
        self.repository.onSaveSession = { expectSave.fulfill() }
        self.delegate.onSessionLoaded = {
            let sessionNil:SessionNil? = self.library.session as? SessionNil
            XCTAssertNil(sessionNil, "Session not loaded")
            XCTAssertEqual(Thread.current, Thread.main, "Not main thread")
            expectLoad.fulfill()
        }
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async { self.library.loadSession() }
        self.waitForExpectations(timeout:0.3, handler:nil)
    }
    
    func testLoadUpdatesEmptyBoards() {
        let expect:XCTestExpectation = self.expectation(description:"Not loaded")
        self.delegate.onBoardsUpdated = {
            XCTAssertEqual(Thread.current, Thread.main, "Not main thread")
            expect.fulfill()
        }
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async { self.library.loadBoards() }
        self.waitForExpectations(timeout:0.3, handler:nil)
    }
    
    func testLoadUpdatesNonEmptyBoards() {
        let expect:XCTestExpectation = self.expectation(description:"Not loaded")
        self.library.session.boards = [String(), String()]
        self.delegate.onBoardsUpdated = {
            XCTAssertEqual(self.library.boards.count, self.library.session.boards.count, "Invalid amount")
            XCTAssertEqual(Thread.current, Thread.main, "Not main thread")
            expect.fulfill()
        }
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async { self.library.loadBoards() }
        self.waitForExpectations(timeout:0.3, handler:nil)
    }
}
