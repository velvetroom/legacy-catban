import XCTest
@testable import catban

class TestDeserialiser_History:XCTestCase {
    private var model:Deserialiser!
    private var dataSuccess:Data!
    private var dataWrong:Data!
    private struct Constants {
        static let dataSuccess:String = "CatbanProjectSuccessHistory"
        static let dataWrong:String = "CatbanProjectWrongHistoryType"
        static let firstCreatedExpected:Int = 100000
        static let expectedHistory:Int = 4
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
        XCTAssertEqual(project.history.items.count, Constants.expectedHistory, "Invalid number of history items")
    }
    
    func testParsedCreated() {
        var project:ProjectProtocol!
        do { try project = self.model.deserialise(project:self.dataSuccess) } catch { }
        for item:HistoryItemProtocol in project.history.items {
            XCTAssertGreaterThan(item.created, 0, "Failed to parse created")
        }
    }
    
    func testFirstCreated() {
        var project:ProjectProtocol!
        do { try project = self.model.deserialise(project:self.dataSuccess) } catch { }
        XCTAssertEqual(project.history.items.first?.created, Constants.firstCreatedExpected,
                       "Invalid created")
    }
    
    func testErrorWrongJson() {
        XCTAssertThrowsError(try self.model.deserialise(project:self.dataWrong), "Failed to throw an error")
    }
}
