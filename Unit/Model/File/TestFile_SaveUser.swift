import XCTest
@testable import catban

class TestFile_SaveUser:XCTestCase {
    private var model:File!
    private var user:Data!
    
    override func setUp() {
        super.setUp()
        self.model = File()
        self.user = Data()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.user, "Failed to load user")
    }
    
    func testNoThrows() {
        XCTAssertNoThrow(try self.model.save(user:self.user), "Failed to save user")
    }
}
