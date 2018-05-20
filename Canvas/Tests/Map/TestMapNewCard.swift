import XCTest
@testable import Canvas

class TestMapNewCard:XCTestCase {
    private var model:MapNewCard!
    
    override func setUp() {
        super.setUp()
        self.model = MapNewCard()
    }
    
    func testNotRetainingView() {
        self.model.view = MockViewNode()
        XCTAssertNil(self.model.view, "Retains")
    }
    
    func testNotRetainingParent() {
        self.model.parent = MockMapParentProtocol()
        XCTAssertNil(self.model.parent, "Retains")
    }
}
