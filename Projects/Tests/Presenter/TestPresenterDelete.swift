import XCTest
@testable import Projects

class TestPresenterDelete:XCTestCase {
    private var presenter:PresenterDelete!
    private var controller:MockController!
    private var view:View!
    
    override func setUp() {
        super.setUp()
        self.presenter = PresenterDelete()
        self.controller = MockController()
        self.view = View()
        self.presenter.item = ViewModelListItem()
        self.presenter.view = self.view
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
