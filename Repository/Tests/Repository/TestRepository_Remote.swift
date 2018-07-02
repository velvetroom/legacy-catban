import XCTest
@testable import Repository

class TestRepository_Remote:XCTestCase {
    private var repository:Repository!
    
    override func setUp() {
        super.setUp()
        self.repository = Repository()
    }
    
    func testStartsCloudReturnsNoError() {
        
    }
}
