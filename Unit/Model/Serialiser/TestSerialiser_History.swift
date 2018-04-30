import XCTest
@testable import catban

class TestSerialiser_History:XCTestCase {
    private var model:Serialiser!
    private var project:Project!
    private var history:History!
    private var serialised:[Any]!
    
    override func setUp() {
        super.setUp()
        self.model = Serialiser()
        self.project = Project()
        self.history = History()
        self.project.history = self.history
        self.configureHistory()
        self.serialised = self.model.historyArrayWith(project:self.project)
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.project, "Failed to load project")
        XCTAssertNotNil(self.history, "Failed to load history")
        XCTAssertNotNil(self.serialised, "Failed to serialise history")
    }
    
    func testSameAmount() {
        XCTAssertEqual(self.serialised.count, self.project.history.items.count, "Incorrect number of items")
    }
    
    func testCreated() {
        let firstItem:[String:Any] = self.serialised.first as! [String:Any]
        let created:Int = firstItem[Serialiser.Constants.History.created] as! Int
        XCTAssertEqual(created, self.project.history.items.first?.created, "Failed to parse created")
    }
    
    func testItemType() {
        let firstItem:[String:Any] = self.serialised.first as! [String:Any]
        let itemTypeString:String = firstItem[Serialiser.Constants.History.itemType] as! String
        let itemType:SerialiserHistoryItemType? = SerialiserHistoryItemType(rawValue:itemTypeString)
        XCTAssertNotNil(itemType, "Failed to serialise item type")
        XCTAssertEqual(itemType, SerialiserHistoryItemType.createCard, "Invalid item type")
    }
    
    private func configureHistory() {
        for _:Int in 0 ..< 3 {
            self.appendItemToHistory()
        }
    }
    
    private func appendItemToHistory() {
        var item:HistoryItemCreateCard = HistoryItemCreateCard()
        item.created = Int(Date().timeIntervalSince1970)
        self.history.items.append(item)
    }
}
