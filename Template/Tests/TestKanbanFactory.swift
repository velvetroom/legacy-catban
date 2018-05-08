import XCTest
@testable import Template
@testable import Board

class TestKanbanFactory:XCTestCase {
    private var model:ProjectProtocol!
    private struct Constants {
        static let totalColumns:Int =
    }
    
    override func setUp() {
        super.setUp()
        self.model = KanbanFactory.newProject()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
    }
    
    func testTotalColumns() {
        XCTAssertEqual(self.model.countColumns, Constants.totalColumns, "Invalid number of columns")
    }
    
    func testColumnTitles() {
        let e = EnumeratedSequence
    }
}
