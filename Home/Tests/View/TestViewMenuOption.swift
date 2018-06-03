import XCTest
@testable import Home

class TestViewMenuOption:XCTestCase {
    private var view:ViewMenuOption!
    
    override func setUp() {
        super.setUp()
        self.view = ViewMenuOption()
    }
    
    func testNotRetainingName() {
        self.view.nameLabel = UILabel()
        XCTAssertNil(self.view.nameLabel, "Retains")
    }
}
