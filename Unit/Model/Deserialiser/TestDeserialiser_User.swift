import XCTest
@testable import catban

class TestDeserialiser_User:XCTestCase {
    private var model:Deserialiser!
    private var dataSuccess:Data!
    private struct Constants {
        static let dataSuccess:String = "CatbanUserSuccess"
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
//        XCTAssertNoThrow(try self.model.deserialise(user:self.dataSuccess), "Failed deserialising user")
    }
}
