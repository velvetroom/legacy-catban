import XCTest
@testable import catban

class TestProject_DeleteCard:XCTestCase {
    private var model:Project!
    private var column:MockProjectColumn!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.model = Project()
        self.column = MockProjectColumn()
        self.model.columns.append(self.column)
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
    }
    
    func testDeleteCard() {
        self.startExpectation()
        let index:IndexPath = IndexPath(item:1, section:0)
        self.column.onDeleteCardAt = { [weak self] (item:Int) in
            XCTAssertEqual(item, index.item, "Invalid item")
            self?.expect?.fulfill()
        }
        
        self.model.deleteCardAt(indexPath:index)
        self.waitExpectation()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectation() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
