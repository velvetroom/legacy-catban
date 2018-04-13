import XCTest
@testable import catban

class TestLanding_CreateColumn:XCTestCase {
    private var model:Landing!
    private var project:MockProjectProtocol!
    private var updateFactory:MockLandingCollectionUpdateFactoryProtocol!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.model = Landing()
        self.project = MockProjectProtocol()
        self.updateFactory = MockLandingCollectionUpdateFactoryProtocol()
        self.model.project = self.project
        self.model.collectionUpdateFactory = self.updateFactory
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.project, "Failed to load project")
        XCTAssertNotNil(self.updateFactory, "Failed to load update factory")
    }
    
    func testCreateColumnGetUpdatesFromInsertColumn() {
        self.startExpectation()
        self.updateFactory.onInsertColumnIn = { [weak self] (project:ProjectProtocol) in
            let project:MockProjectProtocol? = project as? MockProjectProtocol
            XCTAssertNotNil(project, "Invalid project received")
            self?.expect?.fulfill()
        }
        
        self.model.createColumn()
        
        self.waitExpectations()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectations() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
