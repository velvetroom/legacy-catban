import XCTest
@testable import Projects

class TestViewBase:XCTestCase {
    private var view:ViewBase!
    
    override func setUp() {
        super.setUp()
        self.view = ViewBase()
    }
    
    func testLoadIconButtonOn() {
        let image:UIImage? = UIImage(name:ViewConstants.Add.imageOn, in:ViewBase.self)
        XCTAssertNotNil(image, "Failed to load image")
    }
    
    func testLoadIconButtonOff() {
        let image:UIImage? = UIImage(name:ViewConstants.Add.imageOff, in:ViewBase.self)
        XCTAssertNotNil(image, "Failed to load image")
    }
    
    func testNotRetainingBar() {
        self.view.viewBar = ViewBar()
        XCTAssertNil(self.view.viewBar, "Retains")
    }
    
    func testNotRetainingList() {
        self.view.viewList = ViewList()
        XCTAssertNil(self.view.viewList, "Retains")
    }
    
    func testNotRetainingMenu() {
        self.view.viewMenu = ViewMenu()
        XCTAssertNil(self.view.viewMenu, "Retains")
    }
    
    func testNotRetainingButton() {
        self.view.buttonAdd = UIButton()
        XCTAssertNil(self.view.buttonAdd, "Retains")
    }
}
