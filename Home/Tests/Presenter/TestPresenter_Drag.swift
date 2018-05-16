import XCTest
@testable import Home

class TestPresenter_Drag:XCTestCase {
    private var presenter:Presenter!
    private var controller:Controller!
    private var project:MockProjectManagedProtocol!
    
    override func setUp() {
        super.setUp()
        self.presenter = Presenter()
        self.controller = Controller()
        self.project = MockProjectManagedProtocol()
        self.controller.project = self.project
        self.presenter.controller = self.controller
    }
    
    func testCreatesNewDragOnUpdate() {
        self.presenter.drag.columns.append(DragColumn())
        XCTAssertFalse(self.presenter.drag.columns.isEmpty, "Failed to add column")
        self.presenter.shouldUpdate()
        XCTAssertTrue(self.presenter.drag.columns.isEmpty, "Not updated")
    }
}
