import XCTest
import Shared
@testable import Projects

class TestViewImages:XCTestCase {
    func testIconButtonDelete() {
        let image:UIImage? = UIImage(name:ViewConstants.Toolbar.assetDelete, in:View.self)
        XCTAssertNotNil(image, "Failed to load image")
    }
    
    func testIconButtonRename() {
        let image:UIImage? = UIImage(name:ViewConstants.Toolbar.assetRename, in:View.self)
        XCTAssertNotNil(image, "Failed to load image")
    }
    
    func testIconButtonColumns() {
        let image:UIImage? = UIImage(name:ViewConstants.Toolbar.assetColumns, in:View.self)
        XCTAssertNotNil(image, "Failed to load image")
    }
    
    func testLoadImage() {
        let image:UIImage? = UIImage(name:ViewConstants.Empty.icon, in:ViewEmpty.self)
        XCTAssertNotNil(image, "Failed to load image")
    }
}