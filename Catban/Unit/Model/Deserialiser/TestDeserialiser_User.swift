import XCTest
@testable import catban

class TestDeserialiser_User:XCTestCase {
    private var model:Deserialiser!
    private var dataSuccess:Data!
    private var dataWrong:Data!
    private struct Constants {
        static let dataSuccess:String = "CatbanUserSuccess"
        static let dataWrong:String = "CatbanUserWrongIdentifier"
    }
    
    override func setUp() {
        super.setUp()
        self.model = Deserialiser()
        self.dataSuccess = CatbanFileLoader.loadWith(name:Constants.dataSuccess)
        self.dataWrong = CatbanFileLoader.loadWith(name:Constants.dataWrong)
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.dataSuccess, "Failed to load data success")
        XCTAssertNotNil(self.dataWrong, "Failed to load data wrong")
    }
    
    func testSuccessNoThrows() {
        XCTAssertNoThrow(try self.model.deserialise(user:self.dataSuccess), "Failed deserialising user")
    }
    
    func testErrorEmpty() {
        XCTAssertThrowsError(try self.model.deserialise(user:Data()), "Failed to throw an error")
    }
    
    func testErrorWrongJson() {
        XCTAssertThrowsError(try self.model.deserialise(user:self.dataWrong), "Failed to throw an error")
    }
    
    func testUserIdentifier() {
        var user:UserProtocol!
        do {
            try user = self.model.deserialise(user:self.dataSuccess)
        } catch { }
        XCTAssertFalse(user.identifier.isEmpty, "Invalid identifier on user")
    }
    
    func testProjectIdentifier() {
        var user:UserProtocol!
        do {
            try user = self.model.deserialise(user:self.dataSuccess)
        } catch { }
        XCTAssertFalse(user.project.identifier.isEmpty, "Invalid identifier on project from user")
    }
}
