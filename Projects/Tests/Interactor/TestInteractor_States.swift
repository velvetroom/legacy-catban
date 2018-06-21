import XCTest
import Shared
@testable import Tools
@testable import Projects

class TestInteractor_States:XCTestCase {
    private var view:Projects.View!
    private var interactor:Interactor!
    private var board:MockBoardProjectsProtocol!
    private var project:MockProjectManagedProtocol!
    private var transition:MockTransitionProtocol!
    
    override func setUp() {
        super.setUp()
        self.view = Projects.View()
        self.interactor = self.view.presenter.interactor
        self.board = MockBoardProjectsProtocol()
        self.project = MockProjectManagedProtocol()
        self.transition = MockTransitionProtocol()
        var viewModelList:ViewModelList = ViewModelList()
        viewModelList.items.append(ViewModelListItem())
        self.board.project = self.project
        self.interactor.board = self.board
        self.view.transition = self.transition
        self.view.presenter.viewModel.update(property:viewModelList)
        self.project.name = "Lorem ipsum"
    }
    
    func testInitialStateIsDefault() {
        let state:StateDefault? = self.interactor.state as? StateDefault
        XCTAssertNotNil(state, "Invalid state")
    }
    
    func testRenameChangesStateToRename() {
        self.view.selectorRename(button:UIBarButtonItem())
        let state:StateRename? = self.interactor.state as? StateRename
        XCTAssertNotNil(state, "Invalid state")
        XCTAssertNotNil(state?.project, "Failed to inject to project to state")
    }
    
    func testTransitionsToNamer() {
        var transitioned:Bool = false
        self.transition.onPush = { (view:ViewProtocol) in
            let view:NamerView<Interactor>? = view as? NamerView<Interactor>
            let viewModel:NamerViewModelContent? = view?.presenter.viewModel.property()
            XCTAssertNotNil(view, "Invalid view type")
            XCTAssertNotNil(viewModel, "View model not injected")
            XCTAssertFalse(viewModel!.currentName.isEmpty, "Failed to assign name")
            XCTAssertFalse(viewModel!.title.isEmpty, "Failed to assign title")
            transitioned = true
        }
        self.view.selectorRename(button:UIBarButtonItem())
        XCTAssertTrue(transitioned, "No trasition")
    }
    
    func testNamerCancelledChangesToDefault() {
        self.interactor.state = StateRename()
        self.interactor.namerCancelled()
        let state:StateDefault? = self.interactor.state as? StateDefault
        XCTAssertNotNil(state, "Invalid state")
    }
}
