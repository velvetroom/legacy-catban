import XCTest
@testable import catban

class TestSerialiser:XCTestCase {
    private var model:Serialiser!
    private struct Constants {
        static let dictionary:[String:Any] = ["title": "lorem ipsum"]
    }
    
    override func setUp() {
        super.setUp()
        self.model = Serialiser()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
    }
    
    func testDataFromDictionaryNoThrows() {
        XCTAssertNoThrow(try self.model.dataFrom(dictionary:Constants.dictionary))
    }
    
    func testDataFromDictionaryNotEmpty() {
        var data:Data!
        do { data = try self.model.dataFrom(dictionary:Constants.dictionary) } catch { }
        XCTAssertNotNil(data, "Failed to get data")
        XCTAssertFalse(data.isEmpty, "Data is empty")
    }
}
