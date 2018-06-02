import XCTest
@testable import Canvas

class TestPresenterNewColumn:XCTestCase {
    private var presenter:PresenterNewColumn!
    private var view:MockView!
    
    override func setUp() {
        super.setUp()
        self.presenter = PresenterNewColumn()
        self.view = MockView()
        self.presenter.view = self.view
    }
    
    func testNotRetainingView() {
        self.presenter.view = View()
        XCTAssertNil(self.presenter.view, "Retains")
    }
    
    func testAssignViewToColumn() {
        XCTAssertNotNil(self.presenter.mapColumn.view, "Not assigning")
    }
    
    func testLoadActivateConstraints() {
        self.presenter.load()
        
        XCTAssertTrue(self.presenter.viewNewColumn.layoutTop.isActive, "Not active")
        XCTAssertTrue(self.presenter.viewNewColumn.layoutLeft.isActive, "Not active")
        XCTAssertTrue(self.presenter.viewNewColumn.layoutWidth.isActive, "Not active")
        XCTAssertTrue(self.presenter.viewNewColumn.layoutHeight.isActive, "Not active")
    }
    
    func testAssignsMapItemToView() {
        XCTAssertNotNil(self.presenter.viewNewColumn.mapNode, "Not assigned")
    }
}
