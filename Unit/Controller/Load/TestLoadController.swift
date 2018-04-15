import XCTest
@testable import catban

class TestLoadController:UnitTest {
    private var controller:LoadController!
    private var model:MockLoadProtocol!
    
    override func setUp() {
        super.setUp()
        self.controller = LoadController()
        self.model = MockLoadProtocol()
        self.controller.model = self.model
    }
    
    func testLoad() {
        XCTAssertNotNil(self.controller, "Failed to load controller")
        XCTAssertNotNil(self.model, "Failed to load model")
    }
    
    func testAddTitle() {
        XCTAssertNotNil(self.controller.view, "Failed to load view")
        XCTAssertNotNil(self.controller.title, "Failed to assign title")
    }
    
    func testLoadBoardOnViewDidLoad() {
        self.startExpectation()
        self.model.onLoadBoard = { [weak self] in
            self?.expect?.fulfill()
        }
        
        XCTAssertNotNil(self.controller.view, "Failed to load view")
        
        self.waitExpectations()
    }
}
