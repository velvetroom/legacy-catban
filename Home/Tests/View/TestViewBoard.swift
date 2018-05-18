import XCTest
@testable import Home

class TestViewBoard:XCTestCase {
    private var view:ViewBoard!
    
    override func setUp() {
        super.setUp()
        self.view = ViewBoard()
    }
    
    func testRemoveSubviews() {
        self.addSubviews()
        XCTAssertFalse(self.view.subviews.isEmpty, "Should not be empty")
        
        self.view.removeSubviews()
        XCTAssertTrue(self.view.subviews.isEmpty, "Should be empty")
    }
    
    private func addSubviews() {
        self.view.addSubview(UIView())
        self.view.addSubview(UIView())
        self.view.addSubview(UIView())
    }
}
