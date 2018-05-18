import XCTest
@testable import Home

class TestPresenterOutletsLoader:XCTestCase {
    private var presenter:PresenterOutletsLoader!
    
    override func setUp() {
        super.setUp()
        self.presenter = PresenterOutletsLoader()
    }
    
    func testNotRetainingView() {
        self.presenter.view = View()
        XCTAssertNil(self.presenter.view, "Retaining view")
    }
    
    func testLoadOutlets() {
        let view:View = View()
        let parentPresenter:Presenter = Presenter()
        let controller:Controller = Controller()
        parentPresenter.controller = controller
        self.presenter.presenter = parentPresenter
        self.presenter.view = view
        self.presenter.loadOutlets()
        XCTAssertNotNil(parentPresenter.outlets.view, "Failed to load")
        XCTAssertNotNil(parentPresenter.outlets.viewScroll, "Failed to load")
        XCTAssertNotNil(parentPresenter.outlets.viewBoard, "Failed to load")
        XCTAssertNotNil(parentPresenter.outlets.viewBoard?.drag.controller, "Controller not assigned")
    }
}
