import XCTest
import Shared
@testable import Projects

class TestPresenter:XCTestCase {
    private var presenter:Presenter!
    private var controller:Controller!
    private var board:MockBoardProjectsProtocol!
    private var project:MockProjectManagedProtocol!
    private var view:Projects.View!
    private var transition:MockTransitionProtocol!
    private var viewList:ViewList!
    
    override func setUp() {
        super.setUp()
        self.presenter = Presenter()
        self.view = Projects.View()
        self.controller = Controller()
        self.board = MockBoardProjectsProtocol()
        self.project = MockProjectManagedProtocol()
        self.transition = MockTransitionProtocol()
        self.viewList = ViewList()
        self.presenter.list.items = [ViewModelListItem()]
        self.controller.board = self.board
        self.presenter.controller = self.controller
        self.controller.presenter = self.presenter
        self.controller.transiton = self.transition
        self.board.project = self.project
        self.presenter.outlets.view = self.view
        self.presenter.list.view = self.viewList
        XCTAssertNotNil(self.view.view, "Failed loading view")
    }
    
    func testNotRetainingController() {
        self.presenter.controller = Controller()
        XCTAssertNil(self.presenter.controller, "Retains")
    }
    
    func testNotRetainingDelegate() {
        self.presenter.delegate = Controller()
        XCTAssertNil(self.presenter.delegate, "Retains")
    }
    
    func testViewType() {
        let viewType:Projects.View.Type? = self.presenter.viewType as? Projects.View.Type
        XCTAssertNotNil(viewType, "Invalid view type")
    }
    
    func testInjectsSelfOnView() {
        self.presenter.presenterDidLoadWith(view:self.view)
        XCTAssertNotNil(self.view.presenter, "Not injected")
    }
    
    func testLoadOutlets() {
        self.presenter.presenterDidLoadWith(view:self.view)
        XCTAssertNotNil(self.presenter.outlets.list, "Not loaded")
        XCTAssertNotNil(self.presenter.outlets.selector, "Not loaded")
        XCTAssertNotNil(self.presenter.outlets.menu, "Not loaded")
        XCTAssertNotNil(self.presenter.outlets.empty, "Not loaded")
        XCTAssertNotNil(self.presenter.outlets.renamer, "Not loaded")
        XCTAssertNotNil(self.presenter.outlets.view, "Not loaded")
    }
    
    func testInjectsDelegates() {
        self.presenter.presenterDidLoadWith(view:self.view)
        self.presenter.shouldUpdate()
        XCTAssertNotNil(self.presenter.outlets.list?.delegate, "Not injected")
        XCTAssertNotNil(self.presenter.outlets.list?.dataSource, "Not injected")
    }
    
    func testInjectsRenamer() {
        self.presenter.presenterDidLoadWith(view:self.view)
        self.presenter.shouldUpdate()
        XCTAssertNotNil(self.presenter.renamer.view, "Not set")
    }
    
    func testPresenterCallsDelete() {
        self.presenter.outlets.view = self.view
        self.presenter.deleteType = MockPresenterDelete.self
        self.presenter.delete()
        XCTAssertNotNil(MockPresenterDelete.presenter, "Not called")
        XCTAssertNotNil(MockPresenterDelete.presenter?.controller, "Not injected")
        XCTAssertNotNil(MockPresenterDelete.presenter?.view, "Not injected")
        XCTAssertNotNil(MockPresenterDelete.presenter?.item, "Not injected")
    }
}
