import XCTest
import Shared
@testable import Home

class TestPresenterOutlets:XCTestCase {
    private var presenter:PresenterOutlets!
    
    override func setUp() {
        super.setUp()
        self.presenter = PresenterOutlets()
    }
}
