import XCTest
@testable import catban

class TestFile_SaveProjects:XCTestCase {
    private var model:File!
    private var project:Data!
    
    override func setUp() {
        super.setUp()
        self.model = File()
        self.project = Data()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.project, "Failed to load project")
    }
    
    func testNoThrow() {
        XCTAssertNoThrow(try self.model.save(project:self.project), "Failed to save project")
    }
}
