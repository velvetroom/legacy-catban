import XCTest
@testable import Board

class TestProject_ColumnsManager:XCTestCase {
    private var model:Project!
    
    override func setUp() {
        super.setUp()
        self.model = Project()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
    }
    
    func testCountColumns() {
        XCTAssertEqual(self.model.countColumns, 0, "There should be no columns")
    }
    
    func testCountColumnsAfterAppend() {
        self.model.columns.append(Column())
        XCTAssertEqual(self.model.countColumns, 1, "There should be 1 column")
    }
}
