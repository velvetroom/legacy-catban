import XCTest
@testable import catban

class TestDeserialiser_Projects:XCTestCase {
    private var model:Deserialiser!
    private var dataSuccess:Data!
    private struct Constants {
        static let dataSuccess:String = "CatbanProjectSuccess"
    }
    
    override func setUp() {
        super.setUp()
        self.model = Deserialiser()
        self.dataSuccess = CatbanFileLoader.loadWith(name:Constants.dataSuccess)
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.dataSuccess, "Failed to load data success")
    }
    
    func testSuccessNoThrows() {
        XCTAssertNoThrow(try self.model.deserialise(project:self.dataSuccess), "Failed deserialising project")
    }
}
