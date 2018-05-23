import XCTest
import Board
@testable import Column

class TestController:XCTestCase {
    private var controller:Controller!
    private var transition:MockTransitionProtocol!
    private var project:MockProject!
    
    override func setUp() {
        super.setUp()
        self.controller = Controller()
        self.transition = MockTransitionProtocol()
        self.project = MockProject()
        self.controller.transiton = self.transition
        self.controller.project = self.project
    }
    
    func testNotRetainingColumn() {
        self.controller.column = ColumnFactory.newColumn()
        XCTAssertNil(self.controller.column, "Retains")
    }
    
    func testNotRetainingTransition() {
        self.controller.transiton = MockTransitionProtocol()
        XCTAssertNil(self.controller.transiton, "Retains")
    }
    
    func testInjectsDelegate() {
        XCTAssertNotNil(self.controller.presenter.delegate, "Not injected")
    }
    
    func testInjectsController() {
        let presenter:Column.Presenter = self.controller.presenter as! Column.Presenter
        XCTAssertNotNil(presenter.controller, "Not injected")
    }
    
    func testDoneTransitionsToHome() {
        var transition:Bool = false
        self.transition.onTransitionToHome = {
            transition = true
        }
        
        self.controller.done()
        XCTAssertTrue(transition, "Not transitioned")
    }
}
