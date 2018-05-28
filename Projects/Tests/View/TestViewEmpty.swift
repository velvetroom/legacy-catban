import XCTest
import Shared
@testable import Projects

class TestViewEmpty:XCTestCase {
    private var view:ViewEmpty!
    
    override func setUp() {
        super.setUp()
        self.view = ViewEmpty()
    }
    
    func testLoadImage() {
        let image:UIImage? = UIImage(name:ViewConstants.Empty.icon, in:ViewEmpty.self)
        XCTAssertNotNil(image, "Failed to load image")
    }
}
