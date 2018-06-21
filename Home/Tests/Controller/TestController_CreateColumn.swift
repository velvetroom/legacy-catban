import XCTest
import Shared
import Canvas
@testable import Board
@testable import Home

class TestController_CreateColumn:XCTestCase {
    private var controller:Interactor!
    private var project:MockProjectManagedProtocol!
    private var transition:MockTransitionProtocol!
    
    override func setUp() {
        super.setUp()
        Configuration.canvasType = Canvas.self
        self.controller = Interactor()
        self.project = MockProjectManagedProtocol()
        self.transition = MockTransitionProtocol()
        self.controller.project = self.project
        self.controller.transiton = self.transition
    }
    
    func testCreateColumnCallsProject() {
        self.controller.createNewColumn()
        XCTAssertEqual(self.project.countColumns, 1, "Not called")
    }
    
    func testCreatedColumnHasIdentifier() {
        self.controller.createNewColumn()
        self.project.iterate { (column:ColumnProtocol) in
            XCTAssertFalse(column.identifier.isEmpty, "No identifier")
        }
    }
}
