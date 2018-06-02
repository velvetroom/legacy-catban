import XCTest
import Shared
@testable import Column

class TestViewBase:XCTestCase {
    private var view:ViewBase!
    
    override func setUp() {
        super.setUp()
        self.view = ViewBase()
    }
    
    func testLoadImage() {
        let image:UIImage? = UIImage(name:ViewConstants.Icon.icon, in:ViewBase.self)
        XCTAssertNotNil(image, "Failed to load")
    }
}
