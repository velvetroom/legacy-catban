import XCTest
@testable import Repository

class TestRemote:XCTestCase {
    private var remote:Remote!
    
    override func setUp() {
        super.setUp()
        self.remote = Remote()
    }
    
    func testMakeRemoteIdentifierSucceed() {
        let expect:XCTestExpectation = self.expectation(description:"Identifier not created")
        self.remote.makeIdentifier(onCompletion: { (identifier:String) in
            XCTAssertFalse(identifier.isEmpty, "Invalid identifier")
            expect.fulfill()
        }, onError: { (error:Error) in })
        self.waitForExpectations(timeout:0.3, handler:nil)
    }
}
