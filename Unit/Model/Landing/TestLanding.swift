import XCTest
@testable import catban

class TestLanding:XCTestCase {
    private var model:Landing!
    
    override func setUp() {
        super.setUp()
        self.model = Landing()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNil(self.model.project, "Project property not found")
        XCTAssertNil(self.model.editingCard, "Editing cell property not found")
        XCTAssertNotNil(self.model.projectLoader, "Failed to load project loader")
        XCTAssertNotNil(self.model.viewModelLoader, "Failed to load view model loader")
        XCTAssertNotNil(self.model.presenter, "Failed to load presenter")
    }
}
