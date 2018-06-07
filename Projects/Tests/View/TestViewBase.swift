import XCTest
@testable import Projects

class TestViewBase:XCTestCase {
    private var view:ViewBase!
    
    override func setUp() {
        super.setUp()
        self.view = ViewBase()
    }
}
