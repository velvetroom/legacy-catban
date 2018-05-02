import XCTest
@testable import catban

class TestProjectEditor:XCTestCase {
    private var model:MockProjectEditorProtocol!
    
    override func setUp() {
        super.setUp()
        self.model = MockProjectEditorProtocol()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.model.project, "Failed to load project")
    }
}
