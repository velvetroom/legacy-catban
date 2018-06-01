import XCTest
@testable import catban

class TestDeserialiser:XCTestCase {
    private var model:Deserialiser!
    private var data:Data!
    private struct Constants {
        static let content:String = "{\"lorem\":\"ipsum\"}"
    }
    
    override func setUp() {
        super.setUp()
        self.model = Deserialiser()
        self.data = Constants.content.data(using:String.Encoding.utf8)
        
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.data, "Failed to load data")
    }
    
    func testDictionaryFromDataThrows() {
        XCTAssertThrowsError(try self.model.dictionaryFrom(data:Data()), "Failed to get throw error on invalid")
    }
    
    func testDictionaryFromDataNoThrows() {
        XCTAssertNoThrow(try self.model.dictionaryFrom(data:self.data), "Failed to get dictionary")
    }
}
