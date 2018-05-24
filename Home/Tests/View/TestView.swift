import XCTest
import Shared
@testable import Home

class TestView:XCTestCase {
    private var view:Home.View!
    
    override func setUp() {
        super.setUp()
        self.view = View()
    }
    
    func testLoadImage() {
        let image:UIImage? = UIImage(name:ViewConstants.Menu.icon, in:Home.View.self)
        XCTAssertNotNil(image, "Failed to load image")
    }
}
