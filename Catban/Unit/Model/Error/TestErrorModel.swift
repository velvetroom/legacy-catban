import XCTest
@testable import catban

class TestErrorModel:XCTestCase {
    private var model:ErrorModel!
    
    override func setUp() {
        super.setUp()
        self.model = ErrorModel()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.model.message, "Failed to load message")
        XCTAssertNotNil(self.model.presenter, "Failed to load presenter")
    }
}
