import XCTest
import Shared
@testable import Projects

class TestViewBar:XCTestCase {
    private var view:ViewBar!
    
    override func setUp() {
        super.setUp()
        self.view = ViewBar()
    }
}
