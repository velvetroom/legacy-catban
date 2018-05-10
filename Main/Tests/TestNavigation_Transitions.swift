import XCTest
@testable import Main
@testable import Shared
@testable import Board

class TestNavigation_Transitions:XCTestCase {
    private var model:Navigation!
    private var view:MockNavigationController!
    
    override func setUp() {
        super.setUp()
        Injection().load()
        self.model = Navigation()
        self.view = MockNavigationController()
        self.model.view = self.view
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.view, "Failed to load view")
    }
    
    func testTransitionToRetainsController() {
        self.model.transitionTo(controller:MockControllerProtocol())
        XCTAssertNotNil(self.model.controller, "Failed to retain controller")
    }
    
    func testTransitionToLoad() {
        var transition:Bool = false
        self.view.onSetViewController = { (views:[UIViewController], animated:Bool) in
            let view:View = views.first as! View
            let presenter:PresenterProtocol = view.delegate as! PresenterProtocol
            let controller:ControllerProtocol = presenter.delegate as! ControllerProtocol
            XCTAssertNotNil(controller, "Invalid view received")
            XCTAssertNotNil(controller.transiton, "Failed to assign transition")
            transition = true
        }
        
        self.model.transitionToLoad()
        XCTAssertTrue(transition, "Transition never happened")
    }
    
    func testTransitionToHome() {
        var transition:Bool = false
        self.view.onSetViewController = { (views:[UIViewController], animated:Bool) in
            let view:View = views.first as! View
            let presenter:PresenterProtocol = view.delegate as! PresenterProtocol
            let controller:ControllerProjectProtocol = presenter.delegate as! ControllerProjectProtocol
            XCTAssertNotNil(controller, "Invalid view received")
            XCTAssertNotNil(controller.transiton, "Failed to assign transition")
            XCTAssertNotNil(controller.project, "Failed to inject project")
            transition = true
        }
        
        let board:BoardProtocol = BoardFactory.newBoard()
        let project:ProjectProtocol = ProjectFactory.newProject()
        let managed:ProjectManagedProtocol = board.manage(project:project)
        
        self.model.transitionToHome(project:managed)
        XCTAssertTrue(transition, "Transition never happened")
    }
    
    func testTransitionToCard() {
        var transition:Bool = false
        self.view.onSetViewController = { (views:[UIViewController], animated:Bool) in
            let view:View = views.first as! View
            let presenter:PresenterProtocol = view.delegate as! PresenterProtocol
            let controller:ControllerCardProtocol = presenter.delegate as! ControllerCardProtocol
            XCTAssertNotNil(controller, "Invalid view received")
            XCTAssertNotNil(controller.transiton, "Failed to assign transition")
            XCTAssertNotNil(controller.project, "Failed to inject project")
            XCTAssertNotNil(controller.card, "Failed to inject")
            transition = true
        }
        
        let board:BoardProtocol = BoardFactory.newBoard()
        let project:ProjectProtocol = ProjectFactory.newProject()
        let managed:ProjectManagedProtocol = board.manage(project:project)
        let card:CardProtocol = CardFactory.newCard()
        
        self.model.transitionToCard(card:card, in:managed)
        XCTAssertTrue(transition, "Transition never happened")
    }
}
