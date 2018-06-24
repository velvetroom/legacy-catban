import XCTest
@testable import Projects

class TestStateDelete:XCTestCase {
    private var state:StateDelete!
    
    override func setUp() {
        super.setUp()
        self.state = StateDelete()
    }
    
    func testNotRetainingProject() {
        self.state.project = MockProjectManagedProtocol()
        XCTAssertNil(self.state.project, "Retains")
    }
    
    func testOpenDeleterPresentsView() {
        var presented:Bool = false
        let view:Projects.View = Projects.View()
        let transition:MockTransitionProtocol = MockTransitionProtocol()
        let project:MockProjectManagedProtocol = MockProjectManagedProtocol()
        self.state.project = project
        view.presenter.interactor.state = self.state
        view.transition = transition
        transition.onPresent = { presented = true }
        self.state.openDeleter(interactor:view.presenter.interactor)
        XCTAssertTrue(presented, "Not pushed")
    }
    
    func testDeleteConfirmedChangesStateToDefault() {
        let interactor:MockInteractor = MockInteractor()
        interactor.board = MockBoardProjectsProtocol()
        let project:MockProjectManagedProtocol = MockProjectManagedProtocol()
        self.state.project = project
        interactor.state = self.state
        interactor.deleteConfirmed()
        let newState:StateDefault? = interactor.state as? StateDefault
        XCTAssertNotNil(newState, "Not changed")
    }
    
    func testDeleteConfirmedCallsInteractor() {
        var called:Bool = false
        let interactor:MockInteractor = MockInteractor()
        interactor.board = MockBoardProjectsProtocol()
        let project:MockProjectManagedProtocol = MockProjectManagedProtocol()
        self.state.project = project
        interactor.state = self.state
        interactor.onDelete = { called = true }
        interactor.deleteConfirmed()
        XCTAssertTrue(called, "Not called")
    }
}
