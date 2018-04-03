import XCTest
@testable import catban

class TestWriter:XCTestCase {
    private var model:Writer!
    
    override func setUp() {
        super.setUp()
        self.model = Writer()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.model.text, "Failed to load text")
        XCTAssertNotNil(self.model.presenter, "Failed to load presenter")
    }
}
