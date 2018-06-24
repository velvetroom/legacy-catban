import XCTest
import Shared
@testable import Projects

class TestStateAdd:XCTestCase {
    private var state:StateAdd!
    
    override func setUp() {
        super.setUp()
        self.state = StateAdd()
    }
    
    func testNamerFinishedAddsProject() {
        var added:Bool = false
        let interactor:MockInteractor = MockInteractor()
        let name:String = "lorem ipsum"
        interactor.state = self.state
        interactor.onAddProject = { added = true }
        interactor.namerFinishedWith(name:name)
        XCTAssertTrue(added, "Project not added")
    }
    
    func testNamerFinishedChangesStateToDefault() {
        let interactor:MockInteractor = MockInteractor()
        let name:String = "lorem ipsum"
        interactor.state = self.state
        interactor.namerFinishedWith(name:name)
        let newState:StateDefault? = interactor.state as? StateDefault
        XCTAssertNotNil(newState, "Not changed")
    }
    
    func testOpenNamerPushesView() {
        var pushed:Bool = false
        let view:Projects.View = Projects.View()
        let transition:MockTransitionProtocol = MockTransitionProtocol()
        view.presenter.interactor.state = self.state
        view.transition = transition
        transition.onPush = { (view:ViewProtocol) in pushed = true }
        self.state.openNamer(interactor:view.presenter.interactor)
        XCTAssertTrue(pushed, "Not pushed")
    }
}
