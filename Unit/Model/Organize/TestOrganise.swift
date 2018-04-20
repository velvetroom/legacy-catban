import XCTest
@testable import catban

class TestOrganise:XCTestCase {
    private var model:Organise!
    
    override func setUp() {
        super.setUp()
        self.model = Organise()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.model.board, "Failed to load board")
    }
}
