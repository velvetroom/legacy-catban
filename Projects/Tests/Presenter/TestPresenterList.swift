import XCTest
@testable import Projects

class TestPresenterList:XCTestCase {
    private var presenter:PresenterList!
    
    override func setUp() {
        super.setUp()
        self.presenter = PresenterList()
    }
}
