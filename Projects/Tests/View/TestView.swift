import XCTest
@testable import Projects

class TestView:XCTestCase {
    private var view:View!
    private var presenter:Presenter!
    private var controller:MockController!
    
    override func setUp() {
        super.setUp()
        self.view = View()
        self.presenter = Presenter()
        self.controller = MockController()
        self.view.presenter = self.presenter
        self.presenter.controller = self.controller
    }
    
    func testNotRetainingPresenter() {
        self.view.presenter = Presenter()
        XCTAssertNil(self.view.presenter, "Retains")
    }
    
    func testOpenProject() {
        var called:Bool = false
        self.controller.onOpenProject = {
            called = true
        }
        
        self.view.selectorOpen(button:ViewMenuItem())
        XCTAssertTrue(called, "Failed")
    }
    
    func testInjectsRenamerDelegate() {
        XCTAssertNotNil(self.view.view, "Loaded view")
        XCTAssertNotNil(self.view.viewBase.viewRenamer.viewInput.viewField.delegate, "Not injected")
    }
}
