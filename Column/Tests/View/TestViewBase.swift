import XCTest
import Shared
@testable import Column

class TestViewBase:XCTestCase {
    private var view:ViewContent!
    
    override func setUp() {
        super.setUp()
        self.view = ViewContent()
    }
    
    func testLoadImage() {
        let image:UIImage? = UIImage(name:ViewConstants.Icon.icon, in:ViewContent.self)
        XCTAssertNotNil(image, "Failed to load")
    }
}
