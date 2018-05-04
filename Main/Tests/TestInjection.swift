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
        XCTAssertNotNil(Configuration.repositoryBoardType, "Failed to inject repository for board")
        XCTAssertNotNil(Configuration.repositoryProjectType, "Failed to inject repository for project")
        XCTAssertNotNil(Configuration.navigationType, "Failed to inject navigation")
        XCTAssertNotNil(Configuration.controllerLoadType, "Failed to inject controller load")
    }
}
