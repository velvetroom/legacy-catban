import XCTest
import Shared
@testable import Home

class TestView:XCTestCase {
    private var view:Home.View!
    
    override func setUp() {
        super.setUp()
        self.view = View()
    }
    
    func testNotRetainingPresenter() {
        self.view.presenter = Presenter()
        XCTAssertNil(self.view.presenter, "Retains")
    }
    
    func testLoadImage() {
        let image:UIImage? = UIImage(name:ViewConstants.Menu.icon, in:Home.View.self)
        XCTAssertNotNil(image, "Failed to load image")
    }
    
    func testCallShowMenu() {
        
    }
}
