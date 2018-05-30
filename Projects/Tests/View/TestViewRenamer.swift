import XCTest
@testable import Projects

class TestViewRenamer:XCTestCase {
    private var view:ViewRenamer!
    
    override func setUp() {
        super.setUp()
        self.view = ViewRenamer()
    }
}
