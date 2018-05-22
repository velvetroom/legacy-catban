import XCTest
@testable import Canvas

class TestViewItem:XCTestCase {
    private var view:ViewItem!
    
    override func setUp() {
        super.setUp()
        self.view = ViewItem()
    }
}
