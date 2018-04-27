import XCTest
@testable import catban

class TestLanding_History:XCTestCase {
    private var model:Landing!
    private var project:Project!
    private var column:ProjectColumn!
    private var history:MockHistoryProtocol!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.model = Landing()
        self.project = Project()
        self.column = ProjectColumn()
        self.history = MockHistoryProtocol()
        self.project.columns.append(self.column)
        self.model.project = self.project
        self.project.history = self.history
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.project, "Failed to load project")
        XCTAssertNotNil(self.column, "Failed to load column")
        XCTAssertNotNil(self.history, "Failed to load history")
    }
    
    func testCreateCard() {
        self.startExpectation()
        self.history.onCreatedCard = { [weak self] (card:ProjectCard) in
            XCTAssertFalse(card.identifier.isEmpty, "Failed to create identifier")
            self?.expect?.fulfill()
        }
        
        let _:IndexPath = self.model.createCard()
        
        self.waitExpectation()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectation() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
