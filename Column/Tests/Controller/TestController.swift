import XCTest
import Board
@testable import Column

class TestController:XCTestCase {
    private var controller:Controller!
    private var transition:MockTransitionProtocol!
    
    override func setUp() {
        super.setUp()
        self.controller = Controller()
        self.transition = MockTransitionProtocol()
        self.controller.transiton = self.transition
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
}
