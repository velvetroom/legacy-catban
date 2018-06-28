import XCTest
import Shared
import Board
import Projects
import Cloud
import Home
import Load
@testable import Main

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
            XCTAssertNotNil(view?.presenter.interactor.board, "Failed to inject")
            transition = true
        }
        
        let board:BoardProtocol = BoardFactory.newBoard()
        let project:ProjectProtocol = ProjectFactory.newProject()
        self.model.transitionToHome(board:board, project:project)
        XCTAssertTrue(transition, "Transition never happened")
    }
    
    func testTransitionToProjects() {
        var transition:Bool = false
        self.view.onSetViewController = { (views:[UIViewController], animated:Bool) in
            let view:Projects.View? = views.first as? Projects.View
            XCTAssertNotNil(view, "Invalid view received")
            XCTAssertNotNil(view?.transition, "Failed to assign transition")
            XCTAssertNotNil(view?.presenter.interactor.board, "Failed to inject board")
            transition = true
        }
        
        let board:BoardProtocol = BoardFactory.newBoard()
        self.model.transitionToProjects(board:board)
        XCTAssertTrue(transition, "Transition never happened")
    }
    
    func testTransitionToCloud() {
        var transition:Bool = false
        self.view.onSetViewController = { (views:[UIViewController], animated:Bool) in
            let view:Cloud.View? = views.first as? Cloud.View
            XCTAssertNotNil(view, "Invalid view received")
            XCTAssertNotNil(view?.transition, "Failed to assign transition")
            XCTAssertNotNil(view?.presenter.interactor.board, "Failed to inject board")
            XCTAssertNotNil(view?.presenter.interactor.project, "Failed to inject project")
            transition = true
        }
        
        let board:BoardProtocol = BoardFactory.newBoard()
        let project:ProjectProtocol = ProjectFactory.newProject()
        self.model.transitionToCloud(board:board, project:project)
        XCTAssertTrue(transition, "Transition never happened")
    }
}
