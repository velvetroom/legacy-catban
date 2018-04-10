import XCTest
@testable import catban

class TestLanding_ColumnReorderCards:XCTestCase {
    private var model:Landing!
    private var project:MockProjectProtocol!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
        static let column:Int = 321312
    }
    
    override func setUp() {
        super.setUp()
        self.model = Landing()
        self.project = MockProjectProtocol()
        self.model.project = self.project
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
    }
    
    func testReorderGetIndexesFromProject() {
        self.startExpectation()
        self.project.onReorderIndexesForCardsInColumn = { [weak self] (index:Int) in
            XCTAssertEqual(Constants.column, index, "Invalid index received")
            self?.expect?.fulfill()
        }
        self.model.reorderCardsFromColumn(index:Constants.column)
        self.waitExpectation()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectation() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
