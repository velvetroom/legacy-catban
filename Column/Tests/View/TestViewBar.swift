import XCTest
import Shared
@testable import Column

class TestViewBar:XCTestCase {
    private var view:ViewBar!
    
    override func setUp() {
        super.setUp()
        self.view = ViewBar()
    }
    
    func testLoadIconDelete() {
        let icon:UIImage? = UIImage(name:ViewConstants.Delete.icon, in:ViewBar.self)
        XCTAssertNotNil(icon, "Failed to load")
    }
}
