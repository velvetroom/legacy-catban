import XCTest
@testable import catban

class TestRepositoryLocal:XCTestCase {
    private var model:RepositoryLocal!
    
    override func setUp() {
        super.setUp()
        self.model = RepositoryLocal()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.model.file, "Failed to load file")
        XCTAssertNotNil(self.model.deserialiser, "Failed to load deserialiser")
    }
}
