import XCTest
@testable import Board

class TestColumn:XCTestCase {
    private var model:Column!
    
    override func setUp() {
        super.setUp()
        self.model = Column()
    }
    
    func testContainerNotRetained() {
        self.model.container = Project()
        XCTAssertNil(self.model.container, "Strong retain")
    }
}
