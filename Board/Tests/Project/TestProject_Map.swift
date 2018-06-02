import XCTest
@testable import Board

class TestProject_Map:XCTestCase {
    private var model:Project!
    private var columnA:ColumnProtocol!
    private var columnB:ColumnProtocol!
    private var columnC:ColumnProtocol!
    private var columnD:ColumnProtocol!
    private var cardA:CardProtocol!
    private var cardB:CardProtocol!
    private var cardC:CardProtocol!
    private var cardD:CardProtocol!
    
    override func setUp() {
        super.setUp()
        self.model = Project()
        self.columnA = ColumnFactory.newColumn()
        self.columnB = ColumnFactory.newColumn()
        self.columnC = ColumnFactory.newColumn()
        self.columnD = ColumnFactory.newColumn()
        self.cardA = CardFactory.newCard()
        self.cardB = CardFactory.newCard()
        self.cardC = CardFactory.newCard()
        self.cardD = CardFactory.newCard()
        self.columnA.add(card:self.cardA)
        self.columnA.add(card:self.cardB)
        self.columnC.add(card:self.cardC)
        self.columnD.add(card:self.cardD)
        self.model.columns = [self.columnA, self.columnB, self.columnC, self.columnD]
    }
    
    func testMapColumns() {
        let map:[String:ColumnProtocol] = self.model.mapColumns
        
        XCTAssertNotNil(map[self.columnA.identifier], "Not mapped")
        XCTAssertNotNil(map[self.columnB.identifier], "Not mapped")
        XCTAssertNotNil(map[self.columnC.identifier], "Not mapped")
        XCTAssertNotNil(map[self.columnD.identifier], "Not mapped")
    }
    
    func testMapCards() {
        let map:[String:CardProtocol] = self.model.mapCards
        
        XCTAssertNotNil(map[self.cardA.identifier], "Not mapped")
        XCTAssertNotNil(map[self.cardB.identifier], "Not mapped")
        XCTAssertNotNil(map[self.cardC.identifier], "Not mapped")
        XCTAssertNotNil(map[self.cardD.identifier], "Not mapped")
    }
}
