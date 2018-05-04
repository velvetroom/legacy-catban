import XCTest
@testable import Main
@testable import Shared

class TestControllerFactory:XCTestCase {
    override func setUp() {
        super.setUp()
        let injection:Injection = Injection()
        injection.load()
    }
    
    func testFactoryLoad() {
        let controller:ControllerProtocol? = ControllerFactory.factoryLoad()
        XCTAssertNotNil(controller, "Failed to load controller")
    }
}
