import XCTest
@testable import Main
@testable import Shared
@testable import Board
@testable import Projects
@testable import Home
@testable import Load

class TestNavigation_Transitions:XCTestCase {
    private var model:Navigation!
    private var view:MockNavigationView!
    
    override func setUp() {
        super.setUp()
        Injection().load()
        self.model = Navigation()
        self.view = MockNavigationView()
        self.model.view = self.view
    }
    
    func testTransitionToLoad() {
        var transition:Bool = false
        self.view.onSetViewController = { (views:[UIViewController], animated:Bool) in
            let view:Load.View? = views.first as? Load.View
            XCTAssertNotNil(view, "Invalid view received")
            XCTAssertNotNil(view?.transition, "Failed to assign transition")
            transition = true
        }
        
        self.model.transitionToLoad()
        XCTAssertTrue(transition, "Transition never happened")
    }
    
    func testTransitionToHome() {
        var transition:Bool = false
        self.view.onSetViewController = { (views:[UIViewController], animated:Bool) in
            let view:Home.View? = views.first as? Home.View
            XCTAssertNotNil(view, "Invalid view received")
            XCTAssertNotNil(view?.transition, "Failed to assign transition")
            XCTAssertNotNil(view?.presenter.interactor.project, "Failed to inject project")
            transition = true
        }
        
        let board:BoardProtocol = BoardFactory.newBoard()
        let project:ProjectProtocol = ProjectFactory.newProject()
        let managed:ProjectManagedProtocol = board.manage(project:project)
        self.model.transitionToHome(project:managed)
        XCTAssertTrue(transition, "Transition never happened")
    }
    
    func testTransitionToProjects() {
        var transition:Bool = false
        self.view.onSetViewController = { (views:[UIViewController], animated:Bool) in
            let view:Projects.View? = views.first as? Projects.View
            XCTAssertNotNil(view, "Invalid view received")
            XCTAssertNotNil(view?.transition, "Failed to assign transition")
            XCTAssertNotNil(view?.presenter.interactor.board, "Failed to inject project")
            transition = true
        }
        
        let board:BoardProtocol = BoardFactory.newBoard()
        self.model.transitionToProjects(board:board)
        XCTAssertTrue(transition, "Transition never happened")
    }
}
