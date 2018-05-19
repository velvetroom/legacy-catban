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
        XCTAssertNotNil(Configuration.controllerLoadType, "Failed to inject controller load")
        XCTAssertNotNil(Configuration.controllerHomeType, "Failed to inject controller home")
        XCTAssertNotNil(Configuration.controllerCardType, "Failed to inject controller card")
        XCTAssertNotNil(Configuration.canvasType, "Failed to inject canvas")
    }
}
