import XCTest
@testable import catban

class TestSerialiser:XCTestCase {
    private var model:Serialiser!
    
    override func setUp() {
        super.setUp()
        self.model = Serialiser()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
    }
}
