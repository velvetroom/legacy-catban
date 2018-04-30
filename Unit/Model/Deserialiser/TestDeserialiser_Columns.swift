import XCTest
@testable import catban

class TestDeserialiser_Columns:XCTestCase {
    private var model:Deserialiser!
    private var dataSuccess:Data!
    private var dataWrong:Data!
    private struct Constants {
        static let dataSuccess:String = "CatbanProjectSuccess"
        static let dataWrong:String = "CatbanProjectWrongColumnName"
        static let expectedColumns:Int = 3
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
    
    func testNumberOfColumns() {
        var project:ProjectProtocol!
        do { try project = self.model.deserialise(project:self.dataSuccess) } catch { }
        XCTAssertEqual(project.columns.count, Constants.expectedColumns, "Invalid number of columns deserialised")
    }
    
    func testParsedName() {
        var project:ProjectProtocol!
        do { try project = self.model.deserialise(project:self.dataSuccess) } catch { }
        for column:ProjectColumn in project.columns {
            XCTAssertFalse(column.name.isEmpty, "Failed to parse name")
        }
    }
    
    func testParsedIdentifier() {
        var project:ProjectProtocol!
        do { try project = self.model.deserialise(project:self.dataSuccess) } catch { }
        for column:ProjectColumn in project.columns {
            XCTAssertFalse(column.identifier.isEmpty, "Failed to parse identifier")
        }
    }
    
    func testErrorWrongJson() {
        XCTAssertThrowsError(try self.model.deserialise(project:self.dataWrong), "Failed to throw an error")
    }
}
