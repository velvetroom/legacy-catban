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
        self.presenter.outlets.view = self.view
    }
    
    func testLoad() {
        XCTAssertNotNil(self.presenter, "Failed to load presenter")
        XCTAssertNotNil(self.presenter.outlets, "Failed to load outlets")
        XCTAssertNotNil(self.presenter.view.delegate, "Failed to assign delegate")
        XCTAssertNotNil(self.delegate, "Failed to load delegate")
        XCTAssertNotNil(self.controller, "Failed to load controller")
        XCTAssertNotNil(self.project, "Failed to load project")
        XCTAssertNotNil(self.view, "Failed to load view")
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
    
    func testUpdateWithProject() {
        self.presenter.shouldUpdate()
        XCTAssertEqual(self.presenter.outlets.view?.title, Constants.projectName, "Failed to update view model")
    }
}
