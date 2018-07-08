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
    
    func testIconButtonCloud() {
        let image:UIImage? = UIImage(name:ViewConstants.Toolbar.assetCloud, in:View.self)
        XCTAssertNotNil(image, "Failed to load image")
    }
    
    func testEmptyImage() {
        let image:UIImage? = UIImage(name:ViewConstants.Empty.icon, in:View.self)
        XCTAssertNotNil(image, "Failed to load image")
    }
    
    func testQrImage() {
        let image:UIImage? = UIImage(name:ViewConstants.Actions.assetQr, in:View.self)
        XCTAssertNotNil(image, "Failed to load image")
    }
    
    func testScanActions() {
        let image:UIImage? = UIImage(name:ViewConstants.ScanActions.assetContinue, in:View.self)
        XCTAssertNotNil(image, "Failed to load image")
    }
}
