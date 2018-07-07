import XCTest
@testable import Tools

class TestSpinner:XCTestCase {
    func testLoadingImages() {
        let images:[UIImage] = Spinner.loadImages()
        XCTAssertEqual(images.count, SpinnerConstants.images, "Invalid amount of images")
    }
}
