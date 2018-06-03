import XCTest
@testable import Column

class TestPresenterDelete:XCTestCase {
    private var presenter:PresenterDelete!
    private var controller:MockController!
    
    override func setUp() {
        super.setUp()
        self.presenter = PresenterDelete()
        self.controller = MockController()
        self.presenter.controller = self.controller
    }
    
    func testDeleteOnConfirm() {
        var showed:Bool = false
        self.controller.onDelete = {
            showed = true
        }
        
        self.presenter.confirmed()
        XCTAssertTrue(showed, "Not showed")
    }
}
