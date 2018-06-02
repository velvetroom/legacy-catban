import XCTest
@testable import Board

class TestProject_Order_Columns:XCTestCase {
    private var model:Project!
    private var order:Order!
    private var columnA:ColumnProtocol!
    private var columnB:ColumnProtocol!
    private var columnC:ColumnProtocol!
    private var orderColumnA:OrderColumn!
    private var orderColumnB:OrderColumn!
    private var orderColumnC:OrderColumn!
    
    override func setUp() {
        super.setUp()
        self.model = Project()
        self.order = Order()
        self.columnA = ColumnFactory.newColumn()
        self.columnB = ColumnFactory.newColumn()
        self.columnC = ColumnFactory.newColumn()
        self.orderColumnA = OrderColumn()
        self.orderColumnB = OrderColumn()
        self.orderColumnC = OrderColumn()
        self.orderColumnA.identifier = self.columnA.identifier
        self.orderColumnB.identifier = self.columnB.identifier
        self.orderColumnC.identifier = self.columnC.identifier
        self.model.columns = [self.columnA, self.columnB, self.columnC]
    }
    
    func testReorderingColumnsNoChange() {
        self.order.columns = [self.orderColumnA, self.orderColumnB, self.orderColumnC]
        self.model.orderWith(order:self.order)
        XCTAssertEqual(self.model.columns[0].identifier, self.columnA.identifier, "Wrong order")
        XCTAssertEqual(self.model.columns[1].identifier, self.columnB.identifier, "Wrong order")
        XCTAssertEqual(self.model.columns[2].identifier, self.columnC.identifier, "Wrong order")
    }
    
    func testReorderingColumnsInverse() {
        self.order.columns = [self.orderColumnC, self.orderColumnB, self.orderColumnA]
        self.model.orderWith(order:self.order)
        XCTAssertEqual(self.model.columns[0].identifier, self.columnC.identifier, "Wrong order")
        XCTAssertEqual(self.model.columns[1].identifier, self.columnB.identifier, "Wrong order")
        XCTAssertEqual(self.model.columns[2].identifier, self.columnA.identifier, "Wrong order")
    }
    
    func testReorderingColumnsRandom() {
        self.order.columns = [self.orderColumnB, self.orderColumnC, self.orderColumnA]
        self.model.orderWith(order:self.order)
        XCTAssertEqual(self.model.columns[0].identifier, self.columnB.identifier, "Wrong order")
        XCTAssertEqual(self.model.columns[1].identifier, self.columnC.identifier, "Wrong order")
        XCTAssertEqual(self.model.columns[2].identifier, self.columnA.identifier, "Wrong order")
    }
}
