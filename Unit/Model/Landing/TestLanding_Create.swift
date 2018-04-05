import XCTest
@testable import catban

class TestLanding_Create:XCTestCase {
    private var model:Landing!
    private var project:MockProjectProtocol!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.model = Landing()
        self.project = MockProjectProtocol()
        self.model.project = project
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.project, "Failed to load project")
    }
    
    func testCreateCard() {
        self.startExpectation()
        self.project.onIndexForNewCard = { [weak self] in
            self?.expect?.fulfill()
        }
        
        self.model.createCard()
        
        self.waitExpectations()
    }
    
    func testInsertCard() {
        self.startExpectation()
        self.project.onInsertCardAt = { [weak self] in
            self?.expect?.fulfill()
        }
        
        self.model.createCard()
        
        self.waitExpectations()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectations() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
