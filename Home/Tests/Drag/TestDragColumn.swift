import XCTest
@testable import Home

class TestDragColumn:XCTestCase {
    private var model:DragColumn!
    private var view:ViewColumn!
    private var layoutLeft:NSLayoutConstraint!
    
    override func setUp() {
        super.setUp()
        self.model = DragColumn()
        self.view = ViewColumn()
        self.layoutLeft = NSLayoutConstraint()
        self.view.layoutLeft = self.layoutLeft
        self.model.view = self.view
    }
    
    func testNotRetainingView() {
        self.view = nil
        XCTAssertNil(self.model.view, "Retains")
    }
    
    func testGetMinX() {
        let x:CGFloat = 34
        self.view.layoutLeft.constant = x
        XCTAssertEqual(self.model.minX, x, "Getter fails")
    }
    
    func testGetMaxX() {
        let x:CGFloat = 23
        let expected:CGFloat = x + ViewConstants.Column.width
        self.view.layoutLeft.constant = x
        XCTAssertEqual(self.model.maxX, expected, "Getter fails")
    }
}
