import XCTest
@testable import Column

class TestPresenterDelete:XCTestCase {
    private var presenter:PresenterDelete!
    private var view:MockView!
    private var controller:MockController!
    
    override func setUp() {
        super.setUp()
        self.presenter = PresenterDelete()
        self.view = MockView()
        self.controller = MockController()
        self.presenter.view = self.view
        self.presenter.controller = self.controller
    }
    
    func testShowNavigationBarOnConfirm() {
        var showed:Bool = false
        self.view.onShowNavigationBar = {
            showed = true
        }
        
        self.presenter.confirmed()
        XCTAssertTrue(showed, "Not showed")
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
