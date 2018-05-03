import XCTest
@testable import catban

class TestUser:XCTestCase {
    private var model:User!
    
    override func setUp() {
        super.setUp()
        self.model = User()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.model.identifier, "Failed to load identifier")
        XCTAssertNotNil(self.model.project, "Failed to load project")
    }
}
