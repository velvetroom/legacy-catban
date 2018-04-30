import XCTest
@testable import catban

class TestRepository_SaveUserToLocal:XCTestCase {
    private var model:Repository!
    private var local:MockRepositoryLocalProtocol!
    private var user:User!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.model = Repository()
        self.local = MockRepositoryLocalProtocol()
        self.user = User()
        self.model.local = self.local
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.local, "Failed to load local")
        XCTAssertNotNil(self.user, "Failed to load user")
    }
    
    func testSaveUserToLocal() {
        self.startExpectation()
        self.local.onSaveUser = { [weak self] (user:UserProtocol) in
            let user:User = user as! User
            XCTAssertTrue(user === self?.user, "Invalid user received")
            self?.expect?.fulfill()
        }
        
        do { try self.model.save(user:self.user) } catch { }
        
        self.waitExpectations()
    }
    
    func testNoThrows() {
        XCTAssertNoThrow(try self.model.save(user:self.user), "Failed to save user")
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectations() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
