import XCTest
@testable import catban

class TestDeserialiser_Projects:XCTestCase {
    private var model:Deserialiser!
    private var dataSuccess:Data!
    private var dataWrong:Data!
    private struct Constants {
        static let dataSuccess:String = "CatbanProjectSuccess"
        static let dataWrong:String = "CatbanProjectWrongIdentifier"
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
        XCTAssertNoThrow(try self.model.deserialise(project:self.dataSuccess), "Failed deserialising project")
    }
    
    func testErrorEmpty() {
        XCTAssertThrowsError(try self.model.deserialise(project:Data()), "Failed throw an error")
    }
    
    func testErrorWrongJson() {
        XCTAssertThrowsError(try self.model.deserialise(project:self.dataWrong), "Failed throw an error")
    }
    
    func testIdentifier() {
        var project:ProjectProtocol!
        do {
            try project = self.model.deserialise(project:self.dataSuccess)
        } catch { }
        XCTAssertFalse(project.identifier.isEmpty, "Invalid identifier on project")
    }
}
