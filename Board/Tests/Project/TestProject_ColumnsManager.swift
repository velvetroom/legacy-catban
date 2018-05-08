import XCTest
@testable import Board

class TestProject_ColumnsManager:XCTestCase {
    private var model:Project!
    
    override func setUp() {
        super.setUp()
        self.model = Project()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
    }
    
    func testCountColumns() {
        XCTAssertEqual(self.model.countColumns, 0, "There should be no columns")
    }
    
    func testCountColumnsAfterAppend() {
        self.model.columns.append(Column())
        XCTAssertEqual(self.model.countColumns, 1, "There should be 1 column")
    }
    
    func testAddColumn() {
        let column:ColumnProtocol = ColumnFactory.newColumn()
        self.model.add(column:column)
        XCTAssertEqual(self.model.countColumns, 1, "Failed to add column")
    }
    
    func testAddColumnNoIdentifierShouldFail() {
        let column:ColumnProtocol = ColumnFactory.blankColumn()
        self.model.add(column:column)
        XCTAssertEqual(self.model.countColumns, 0, "Column with no identifier should not be added")
    }
    
    func testRemoveColumn() {
        let column:ColumnProtocol = ColumnFactory.newColumn()
        self.model.add(column:column)
        XCTAssertEqual(self.model.countColumns, 1, "Failed to add column")
        self.model.remove(column:column)
        XCTAssertEqual(self.model.countColumns, 0, "Failed to remove column")
    }
    
    func testColumnAtIndex() {
        let columnA:ColumnProtocol = ColumnFactory.newColumn()
        let columnB:ColumnProtocol = ColumnFactory.newColumn()
        self.model.add(column:columnA)
        self.model.add(column:columnB)
        let retrieveB:ColumnProtocol = self.model.columnAt(index:1)
        XCTAssertEqual(retrieveB.identifier, columnB.identifier, "Failed to retrive the right column")
    }
    
    func testIterate() {
        let columnA:ColumnProtocol = ColumnFactory.newColumn()
        let columnB:ColumnProtocol = ColumnFactory.newColumn()
        self.model.add(column:columnA)
        self.model.add(column:columnB)
        var foundA:Bool = false
        var foundB:Bool = false
        
        self.model.iterate { (column:ColumnProtocol) in
            if column.identifier == columnA.identifier {
                foundA = true
            } else if column.identifier == columnB.identifier {
                foundB = true
            }
        }
        
        XCTAssertTrue(foundA, "Failed to iterate column A")
        XCTAssertTrue(foundB, "Failed to iterate column B")
    }
}
