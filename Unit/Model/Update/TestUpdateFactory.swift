import XCTest
@testable import catban

class TestUpdateFactory:XCTestCase {
    private var factory:UpdateFactory!
    
    override func setUp() {
        super.setUp()
        self.factory = UpdateFactory()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.factory, "Failed to load factory")
    }
}
