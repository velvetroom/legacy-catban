import XCTest
import Board
@testable import Canvas

class TestModel_Order:XCTestCase {
    private var model:Model!
    private var project:MockProjectOrderProtocol!
    private var mapDelegate:MockMapDelegateProtocol!
    private var card:MapCard!
    private struct inConstants {
        static let identifierA:String = "asd"
        static let identifierB:String = "lorem ipsum"
        static let identifierC:String = "hello world"
        static let cardIdentifier:String = "fox"
    }
    
    override func setUp() {
        super.setUp()
        self.model = Model()
        self.project = MockProjectOrderProtocol()
        self.mapDelegate = MockMapDelegateProtocol()
        self.model.projectOrder = self.project
        self.model.mapDelegate = self.mapDelegate
        let columnA:MapColumn = MapColumn()
        columnA.identifier = inConstants.identifierA
        let columnB:MapColumn = MapColumn()
        columnB.identifier = inConstants.identifierB
        let columnC:MapColumn = MapColumn()
        columnC.identifier = inConstants.identifierC
        self.card = MapCard()
        card.identifier = inConstants.cardIdentifier
        columnC.childItem = card
        self.model.columns = [columnA, columnB, columnC]
    }
    
    func testAddsColumns() {
        let order:Order = self.model.order
        XCTAssertEqual(order.columns[0].identifier, inConstants.identifierA, "Wrong order")
        XCTAssertEqual(order.columns[1].identifier, inConstants.identifierB, "Wrong order")
        XCTAssertEqual(order.columns[2].identifier, inConstants.identifierC, "Wrong order")
    }
    
    func testNumberOfColumns() {
        let order:Order = self.model.order
        XCTAssertEqual(order.columns.count, self.model.columns.count, "Invalid number of columns")
    }
    
    func testColumnsHaveCards() {
        let order:Order = self.model.order
        XCTAssertEqual(order.columns[2].cards[0].identifier, inConstants.cardIdentifier, "Wrong order")
    }
    
    func testArrangeItemReordersProject() {
        var called:Bool = false
        self.model.columns = []
        self.project.onOrderWithOrder = {
            called = true
        }
        
        self.model.arrange(item:MockMapItemProtocol())
        XCTAssertTrue(called, "Not called")
    }
}
