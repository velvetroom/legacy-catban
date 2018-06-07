import XCTest
@testable import Projects

class TestViewNamer:XCTestCase {
    private var view:ViewNamer!
    
    override func setUp() {
        super.setUp()
        self.view = ViewNamer()
    }
}
