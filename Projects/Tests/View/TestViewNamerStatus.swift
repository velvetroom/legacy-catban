import XCTest
import Shared
@testable import Projects

class TestViewNamerStatus:XCTestCase {
    func testValidImage() {
        let image:UIImage? = UIImage(name:ViewConstants.NamerStatus.assetValid, in:ViewNamer.self)
        XCTAssertNotNil(image, "Failed to load")
    }
    
    func testErrorImage() {
        let image:UIImage? = UIImage(name:ViewConstants.NamerStatus.assetError, in:ViewNamer.self)
        XCTAssertNotNil(image, "Failed to load")
    }
}
