import XCTest
import Shared
@testable import Repository

class TestRemote:XCTestCase {
    private var remote:Remote!
    
    override func setUp() {
        super.setUp()
        Configuration.remoteProviderType = MockRemoteProviderProtocol.self
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
    
    func testRemoteSaveReturnsErrorIfNoProvider() {
        Configuration.remoteProviderType = nil
        let expect:XCTestExpectation = self.expectation(description:"Error not returned")
        self.remote.save(data:Data(), identifier:String(), onCompletion: { }, onError: { (error:Error) in
            expect.fulfill()
        })
        self.waitForExpectations(timeout:0.3, handler:nil)
    }
    
    func testReturnErrorIfRemoteFails() {
        MockRemoteProviderProtocol.error = NSError(domain:String(), code:0, userInfo:nil)
        let expect:XCTestExpectation = self.expectation(description:"Error not returned")
        self.remote.save(data:Data(), identifier:String(), onCompletion: { }, onError: { (error:Error) in
            expect.fulfill()
        })
        self.waitForExpectations(timeout:0.3, handler:nil)
    }
}
