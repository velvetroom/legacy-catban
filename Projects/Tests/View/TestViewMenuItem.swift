import XCTest
import Shared
@testable import Projects

class TestViewMenuItem:XCTestCase {
    private var view:ViewMenuItem!
    
    override func setUp() {
        super.setUp()
        self.view = ViewMenuItem()
    }
    
    func testImageDelete() {
        let image:UIImage? = UIImage(name:ViewConstants.MenuItem.iconDelete, in:ViewMenuItem.self)
        XCTAssertNotNil(image, "Failed to load")
    }
    
    func testImageRename() {
        let image:UIImage? = UIImage(name:ViewConstants.MenuItem.iconRename, in:ViewMenuItem.self)
        XCTAssertNotNil(image, "Failed to load")
    }
    
    func testImageOpen() {
        let image:UIImage? = UIImage(name:ViewConstants.MenuItem.iconOpen, in:ViewMenuItem.self)
        XCTAssertNotNil(image, "Failed to load")
    }
}
