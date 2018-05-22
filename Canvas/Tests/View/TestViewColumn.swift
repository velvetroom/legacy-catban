import XCTest
import Shared
@testable import Canvas

class TestViewColumn:XCTestCase {
    func testImage() {
        let image:UIImage? = UIImage(name:Constants.ColumnTitle.icon, in:ViewColumn.self)
        XCTAssertNotNil(image, "Image not found")
    }
}
