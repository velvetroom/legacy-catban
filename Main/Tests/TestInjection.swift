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
        XCTAssertNotNil(Configuration.repositoryType, "Failed to inject repository")
        XCTAssertNotNil(Configuration.navigationType, "Failed to inject navigation")
        XCTAssertNotNil(Configuration.controllerLoadType, "Failed to inject controller load")
    }
}
