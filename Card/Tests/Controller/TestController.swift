import XCTest
@testable import Card
@testable import Board

class TestController:XCTestCase {
    private var controller:Controller!
    private var transition:MockTransitionProtocol!
    private var project:ProjectManagedProtocol!
    
    override func setUp() {
        super.setUp()
        self.controller = Controller()
        self.transition = MockTransitionProtocol()
        let project:ProjectProtocol = ProjectFactory.newProject()
        let board:BoardProtocol = BoardFactory.newBoard()
        let managed:ProjectManagedProtocol = board.manage(project:project)
        self.project = managed
        self.controller.transiton = self.transition
        self.controller.project = self.project
    }
    
    func testPresenter() {
        XCTAssertNotNil(self.controller.presenter, "Failed to load")
        XCTAssertNotNil(self.controller.presenter.delegate, "Failed to assign")
    }
    
    func testControllerOnPresenter() {
        let presenter:Presenter = self.controller.presenter as! Presenter
        XCTAssertNotNil(presenter.controller, "Failed to assign")
    }
    
    func testCardIsNotRetained() {
        self.controller.card = CardFactory.newCard()
        XCTAssertNil(self.controller.card, "Strong retained")
    }
    
    func testTransitionIsNotRetained() {
        self.transition = nil
        XCTAssertNil(self.controller.transiton, "Strong retained")
    }
    
    func testDone() {
        var transitioned:Bool = false
        self.transition.onTransitionToHome = {
            transitioned = true
        }
        
        self.controller.done()
        XCTAssertTrue(transitioned, "No transition")
    }
}
