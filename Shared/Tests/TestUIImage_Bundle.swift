import XCTest
@testable import Shared

class TestUIImage_Bundle:XCTestCase {
    func testImageNotFound() {
        let image:UIImage? = UIImage(name:String(), in:View.self)
        XCTAssertNil(image, "Should return nil image")
    }
}
