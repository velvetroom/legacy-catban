import XCTest
import Shared
@testable import Cloud

class TestView:XCTestCase {
    private var view:Cloud.View!
    
    override func setUp() {
        super.setUp()
        self.view = Cloud.View()
    }
    
    func testLoadImageNotClouded() {
        let image:UIImage = UIImage(name:ViewConstants.Icon.assetNotClouded, in:Cloud.View.self)
        XCTAssertNotNil(image, "Failed to load")
    }
    
    func testLoadImageClouded() {
        let image:UIImage = UIImage(name:ViewConstants.Icon.assetCloud, in:Cloud.View.self)
        XCTAssertNotNil(image, "Failed to load")
    }
    
    func testLoadImageUpToDate() {
        let image:UIImage = UIImage(name:ViewConstants.Icon.assetUpToDate, in:Cloud.View.self)
        XCTAssertNotNil(image, "Failed to load")
    }
    
    func testLoadImageAction() {
        let image:UIImage = UIImage(name:ViewConstants.Action.asset, in:Cloud.View.self)
        XCTAssertNotNil(image, "Failed to load")
    }
}
