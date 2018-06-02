import XCTest
@testable import Column
@testable import Board

class TestPresenter_Actions:XCTestCase {
    private var presenter:Presenter!
    private var column:ColumnProtocol!
    private var controller:MockController!
    private var field:ViewInputField!
    
    override func setUp() {
        super.setUp()
        self.presenter = Presenter()
        self.column = ColumnFactory.newColumn()
        self.controller = MockController()
        self.field = ViewInputField()
        self.presenter.controller = self.controller
        self.controller.column = self.column
        self.presenter.outlets.viewField = self.field
    }
    
    func testDoneUpdatesColumn() {
        let updated:String = "lorem ipsum"
        self.field.text = updated
        
        self.presenter.done()
        XCTAssertEqual(self.column.name, updated, "Not updated")
    }
    
    func testDoneCallsController() {
        var called:Bool = false
        self.controller.onDone = {
            called = true
        }
        
        self.presenter.done()
        XCTAssertTrue(called, "Not called")
    }
}
