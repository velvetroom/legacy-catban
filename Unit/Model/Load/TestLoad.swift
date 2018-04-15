import XCTest
@testable import catban

class TestLoad:UnitTest {
    private var model:Load!
    
    override func setUp() {
        super.setUp()
        self.model = Load()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
    }
    
    func testLoadBoard() {
        self.startExpectation()
        
        self.model.loadBoard { [weak self] (board:BoardProtocol) in
            self?.expect?.fulfill()
        }
        
        self.waitExpectations()
    }
}
