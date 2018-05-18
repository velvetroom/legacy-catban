import XCTest
import Board
@testable import Home

class TestPresenter_Map:XCTestCase {
    private var presenter:Presenter!
    private var map:MockMapProtocol!
    private var controller:Controller!
    private var project:ProjectManagedProtocol!
    
    override func setUp() {
        super.setUp()
        self.presenter = Presenter()
        self.map = MockMapProtocol()
        self.controller = Controller()
        self.project = MockProjectManagedProtocol()
        self.presenter.map = self.map
        self.controller.project = self.project
        self.presenter.controller = self.controller
    }
    
    func testClearsMapOnUpdate() {
        var called:Bool = false
        self.map.onClear = {
            called = true
        }
        
        self.presenter.shouldUpdate()
        XCTAssertTrue(called, "Not cleared")
    }
}
