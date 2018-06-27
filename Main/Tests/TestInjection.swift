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
        XCTAssertNotNil(Configuration.viewLoadType, "Failed to inject controller load")
        XCTAssertNotNil(Configuration.viewHomeType, "Failed to inject controller home")
        XCTAssertNotNil(Configuration.viewCardType, "Failed to inject controller card")
        XCTAssertNotNil(Configuration.viewColumnType, "Failed to inject controller column")
        XCTAssertNotNil(Configuration.viewProjectsType, "Failed to inject controller projects")
        XCTAssertNotNil(Configuration.canvasType, "Failed to inject canvas")
        XCTAssertNotNil(Configuration.directoryRoot, "Failed to inject directory root")
    }
}
