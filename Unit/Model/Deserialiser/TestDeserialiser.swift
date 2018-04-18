import XCTest
@testable import catban

class TestDeserialiser:XCTestCase {
    private var model:Deserialiser!
    
    override func setUp() {
        super.setUp()
        self.model = Deserialiser()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
    }
}
