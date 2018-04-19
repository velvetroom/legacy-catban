import XCTest
@testable import catban

class TestDeserialiser_Columns:XCTestCase {
    private var model:Deserialiser!
    private var data:Data!
    private struct Constants {
        static let data:String = "CatbanProjectSuccess"
        static let expectedColumns:Int = 3
    }
    
    override func setUp() {
        super.setUp()
        self.model = Deserialiser()
        self.data = CatbanFileLoader.loadWith(name:Constants.data)
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.data, "Failed to load data")
    }
    
    func testNumberOfColumns() {
        var project:ProjectProtocol!
        do {
            try project = self.model.deserialise(project:self.data)
        } catch { }
        XCTAssertEqual(project.columns.count, Constants.expectedColumns, "Invalid number of columns deserialised")
    }
}
