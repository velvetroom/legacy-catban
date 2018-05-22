import XCTest
import Shared
@testable import Canvas

class TestViewColumn:XCTestCase {
    private var view:ViewColumn!
    
    override func setUp() {
        super.setUp()
        self.view = ViewColumn()
    }
    
    func testAssignsDragState() {
        let stateType:DragStateFixed.Type? = self.view.dragState as? DragStateFixed.Type
        XCTAssertNotNil(stateType, "Invalid state type")
    }
    
    func testImage() {
        let image:UIImage? = UIImage(name:Constants.ColumnTitle.icon, in:ViewColumn.self)
        XCTAssertNotNil(image, "Image not found")
    }
}
