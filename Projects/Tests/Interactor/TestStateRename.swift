import XCTest
@testable import Projects

class TestStateRename:XCTestCase {
    private var state:StateRename!
    
    override func setUp() {
        super.setUp()
        self.state = StateRename()
    }
    
    func testNotRetainingProject() {
        self.state.project = MockProjectManagedProtocol()
        XCTAssertNil(self.state.project, "Retains")
    }
}
