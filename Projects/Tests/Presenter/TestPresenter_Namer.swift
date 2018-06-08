import XCTest
@testable import Projects

class TestPresenter_Namer:XCTestCase {
    private var presenter:Presenter!
    private var controller:MockController!
    
    override func setUp() {
        super.setUp()
        self.presenter = Presenter()
        self.controller = MockController()
        self.presenter.controller = self.controller
        self.presenter.list.items = [ViewModelListItem()]
    }
    
    func testRenameProjectCallsController() {
        var called:Bool = false
        self.controller.onRenameProject = {
            called = true
        }
        
        self.presenter.renameProject()
        XCTAssertTrue(called, "Failed to call project")
    }
}
