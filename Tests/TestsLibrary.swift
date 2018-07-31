import XCTest
@testable import Domain

class TestsLibrary:XCTestCase {
    private var library:Library!
    
    override func setUp() {
        super.setUp()
        Configuration.repositoryType = MockRepositoryProtocol.self
        self.library = Library()
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
