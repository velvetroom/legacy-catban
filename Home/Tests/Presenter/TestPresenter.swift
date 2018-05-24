import XCTest
@testable import Shared
@testable import Home
@testable import Board

class TestPresenter:XCTestCase {
    private var presenter:Presenter!
    private var controller:Controller!
    private var delegate:MockControllerProtocol!
    private var project:ProjectManagedProtocol!
    private var view:Home.View!
    private struct Constants {
        static let projectName:String = "lorem ipsum"
    }
    
    override func setUp() {
        super.setUp()
        self.presenter = Presenter()
        self.controller = Controller()
        self.presenter.controller = self.controller
        self.delegate = MockControllerProtocol()
        self.view = View()
        let board:BoardProtocol = BoardFactory.newBoard()
        let project:ProjectProtocol = ProjectFactory.newProject()
        self.project = board.manage(project:project)
        self.project.name = Constants.projectName
        self.controller.project = self.project
        self.presenter.delegate = self.delegate
    }
    
    func testViewType() {
        let view:Home.View? = self.presenter.view as? Home.View
        XCTAssertNotNil(view, "Invalid view received")
    }
    
    func testLoadView() {
        let view:Home.View? = self.presenter.view as? Home.View
        XCTAssertNotNil(view, "Invalid view received")
    }
    
    func testLoadViewCallsDelegate() {
        var delegateCalled:Bool = false
        self.delegate.onDidLoadPresenter = {
            delegateCalled = true
        }
        
        self.presenter.didLoad(view:Shared.View())
        XCTAssertTrue(delegateCalled, "Failed to call delegate")
    }
    
    func testDelegateIsNotRetained() {
        self.presenter.delegate = Controller()
        XCTAssertNil(self.presenter.delegate, "Strong retained delegate")
    }
    
    func testControllerIsNotRetained() {
        self.presenter.controller = Controller()
        XCTAssertNil(self.presenter.controller, "Strong retained controller")
    }
    
    func testDidLoadAssignsViewToOutlets() {
        let view:Shared.View = Shared.View()
        self.presenter.didLoad(view:view)
        XCTAssertNotNil(self.presenter.outlets.view, "Not assigned")
    }
    
    func testUpdateProjectTitle() {
        self.presenter.outlets.view = self.view
        self.presenter.shouldUpdate()
        XCTAssertEqual(self.view.title, Constants.projectName, "Not updated")
    }
    
    func testInjectsProjectInCanvas() {
        self.presenter.shouldUpdate()
        XCTAssertNotNil(self.presenter.canvas.project, "Not injected")
    }
    
    func testInjectsItselfInView() {
        self.presenter.didLoad(view:self.view)
        XCTAssertNotNil(self.view.presenter, "Not injected")
    }
}
