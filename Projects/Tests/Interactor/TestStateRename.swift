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
    
    func testNamerFinishedUpdatesProject() {
        var called:Bool = false
        let project:MockProjectManagedProtocol = MockProjectManagedProtocol()
        let interactor:MockInteractor = MockInteractor()
        let name:String = "lorem ipsum"
        interactor.state = self.state
        self.state.project = project
        interactor.onUpdated = { called = true }
        interactor.namerFinishedWith(name:name)
        XCTAssertTrue(called, "State not called")
    }
}
