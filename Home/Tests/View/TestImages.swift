import XCTest
import Shared
@testable import Home

class TestImages:XCTestCase {
    func testLoadImageMenu() {
        let image:UIImage? = UIImage(name:ViewConstants.Menu.icon, in:Home.View.self)
        XCTAssertNotNil(image, "Failed to load image")
    }
    
    func testLoadImageCloud() {
        let image:UIImage? = UIImage(name:ViewConstants.Icons.cloud, in:Home.View.self)
        XCTAssertNotNil(image, "Failed to load image")
    }
    
    func testLoadImageProjects() {
        let image:UIImage? = UIImage(name:ViewConstants.Icons.projects, in:Home.View.self)
        XCTAssertNotNil(image, "Failed to load image")
    }
    
    func testLoadImageAbout() {
        let image:UIImage? = UIImage(name:ViewConstants.Icons.about, in:Home.View.self)
        XCTAssertNotNil(image, "Failed to load image")
    }
}
