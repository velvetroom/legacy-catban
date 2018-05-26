import XCTest
import Shared
@testable import Projects

class TestViewBar:XCTestCase {
    private var view:ViewBar!
    
    override func setUp() {
        super.setUp()
        self.view = ViewBar()
    }
    
    func testLoadIcon() {
        let image:UIImage? = UIImage(name:ViewConstants.Bar.iconImage, in:type(of:ViewBar.self))
        XCTAssertNotNil(image, "Failed to load image")
    }
}
