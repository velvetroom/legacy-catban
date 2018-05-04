import XCTest
@testable import Main
@testable import Shared

class TestInjection:XCTestCase {
    private var model:Injection!
    
    override func setUp() {
        super.setUp()
        self.model = Injection()
        self.model.load()
    }
    
    func testConfigurationIsUpdated() {
        XCTAssertNotNil(Configuration.navigationType, "Failed to inject navigation type")
    }
}
