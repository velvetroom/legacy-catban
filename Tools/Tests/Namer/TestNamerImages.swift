import XCTest
import Shared
@testable import Tools

class TestNamerImages:XCTestCase {
    func testLoadErrorImage() {
        let image:UIImage? = UIImage(name:NamerConstants.Status.assetError, in:NamerFactory.self)
        XCTAssertNotNil(image, "Failed to load")
    }
    
    func testLoadValidImage() {
        let image:UIImage? = UIImage(name:NamerConstants.Status.assetValid, in:NamerFactory.self)
        XCTAssertNotNil(image, "Failed to load")
    }
}
