import XCTest
import Shared
@testable import Home

class TestViewMenuOptions:XCTestCase {
    private var view:ViewMenuOptions!
    
    override func setUp() {
        super.setUp()
        self.view = ViewMenuOptions()
    }
    
    func testImages() {
        XCTAssertNotNil(UIImage(name:ViewConstants.Projects.icon, in:ViewMenuOptions.self), "failed")
        XCTAssertNotNil(UIImage(name:ViewConstants.About.icon, in:ViewMenuOptions.self), "failed")
    }
    
    func testNotRetainingProjects() {
        self.view.optionProjects = ViewMenuOption()
        XCTAssertNil(self.view.optionProjects, "Retains")
    }
    
    func testNotRetainingAbout() {
        self.view.optionAbout = ViewMenuOption()
        XCTAssertNil(self.view.optionAbout, "Retains")
    }
    
    func testNotRetainingLayoutRootTop() {
        self.view.layoutRootTop = NSLayoutConstraint()
        XCTAssertNil(self.view.layoutRootTop, "Retains")
    }
}
