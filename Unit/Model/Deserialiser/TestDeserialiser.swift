import XCTest
@testable import catban

class TestDeserialiser:XCTestCase {
    private var model:Deserialiser!
    
    override func setUp() {
        super.setUp()
        self.model = Deserialiser()
    }
    
    func testLoad() {
        XCTAssertNil(self.model, "Failed to load model")
    }
}
