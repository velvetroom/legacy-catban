import XCTest
@testable import Domain

class TestsLibrary:XCTestCase {
    private var library:Library!
    private var repository:MockRepositoryProtocol!
    
    override func setUp() {
        super.setUp()
        Configuration.repositoryType = MockRepositoryProtocol.self
        self.library = Library()
        self.repository = self.library.repository as? MockRepositoryProtocol
    }
    
    func testSessionStartsWithNullObject() {
        let sessionNil:SessionNil? = self.library.session as? SessionNil
        XCTAssertNotNil(sessionNil, "Session is not the null object")
    }
    
    func testLoadUpdatesSession() {
        let expect:XCTestExpectation = self.expectation(description:"Not loaded")
        self.library.loadSession {
            let sessionNil:SessionNil? = self.library.session as? SessionNil
            XCTAssertNil(sessionNil, "Session not loaded")
            XCTAssertEqual(Thread.current, Thread.main, "Not main thread")
            expect.fulfill()
        }
        self.waitForExpectations(timeout:0.3, handler:nil)
    }
    
    func testLoadCreatesSessionOnError() {
        let expectLoad:XCTestExpectation = self.expectation(description:"Not loaded")
        let expectSave:XCTestExpectation = self.expectation(description:"Not saved")
        self.repository.error = NSError()
        self.repository.onSaveSession = { expectSave.fulfill() }
        self.library.loadSession {
            let sessionNil:SessionNil? = self.library.session as? SessionNil
            XCTAssertNil(sessionNil, "Session not loaded")
            XCTAssertEqual(Thread.current, Thread.main, "Not main thread")
            expectLoad.fulfill()
        }
        self.waitForExpectations(timeout:0.3, handler:nil)
    }
    
    func testLoadUpdatesBoards() {
        let expect:XCTestExpectation = self.expectation(description:"Not loaded")
        self.library.loadBoards(completion: {
            XCTAssertEqual(Thread.current, Thread.main, "Not main thread")
            expect.fulfill()
        }, error:{ (_:Error) in })
        self.waitForExpectations(timeout:0.3, handler:nil)
    }
}
