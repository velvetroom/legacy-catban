import XCTest
import CleanArchitecture
import Shared
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
    
    func testNamerFinishedChangesStateToDefault() {
        let project:MockProjectManagedProtocol = MockProjectManagedProtocol()
        let interactor:MockInteractor = MockInteractor()
        let name:String = "lorem ipsum"
        interactor.state = self.state
        self.state.project = project
        interactor.namerFinishedWith(name:name)
        let newState:StateDefault? = interactor.state as? StateDefault
        XCTAssertNotNil(newState, "Not changed")
    }
    
    func testOpenNamerPushesView() {
        var pushed:Bool = false
        let view:Projects.View = Projects.View()
        let transition:MockTransitionProtocol = MockTransitionProtocol()
        let project:MockProjectManagedProtocol = MockProjectManagedProtocol()
        self.state.project = project
        view.presenter.interactor.state = self.state
        view.transition = transition
        transition.onPush = { (view:ViewProtocol) in pushed = true }
        self.state.openNamer(interactor:view.presenter.interactor)
        XCTAssertTrue(pushed, "Not pushed")
    }
}
