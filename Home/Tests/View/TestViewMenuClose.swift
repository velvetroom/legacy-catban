import XCTest
@testable import Home

class TestViewMenuClose:XCTestCase {
    private var view:ViewMenuClose!
    
    override func setUp() {
        super.setUp()
        self.view = ViewMenuClose()
    }
    
    func testRetainingAlignRight() {
        self.view.layoutAlignRight = NSLayoutConstraint()
        XCTAssertNotNil(self.view.layoutAlignRight, "Not retains")
    }
    
    func testRetainingAlignCentre() {
        self.view.layoutCentre = NSLayoutConstraint()
        XCTAssertNotNil(self.view.layoutCentre, "Not retains")
    }
    
    func testNotRetainingIcon() {
        self.view.icon = UIImageView()
        XCTAssertNil(self.view.icon, "Retains")
    }
    
    func testImageFactory() {
        XCTAssertNotNil(ViewMenuCloseFactory.makeOpenAnimation(), "Factory failed")
        XCTAssertNotNil(ViewMenuCloseFactory.makeCloseAnimation(), "Factory failed")
    }
}
