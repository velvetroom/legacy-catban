import XCTest
@testable import catban

class TestProject_Updates:XCTestCase {
    private var project:Project!
    private var update:MockCollectionUpdateProtocol!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.project = Project()
        self.update = MockCollectionUpdateProtocol()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.project, "Failed to load project")
        XCTAssertNotNil(self.update, "Failed to load update")
    }
    
    func testStrategyUpdates() {
        self.startExpectation()
        self.update.onStrategyProject = { [weak self] (projectProtocol:ProjectProtocol) in
            guard
                let project:Project = projectProtocol as? Project
            else { return }
            XCTAssertTrue(project === self?.project, "Invalid project received")
            self?.expect?.fulfill()
        }
        
        self.project.apply(updates:[self.update])
        
        self.waitExpectation()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectation() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
