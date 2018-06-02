import XCTest
@testable import Canvas

class TestModel_Columns:XCTestCase {
    private var model:Model!
    private var mapDelegate:MockMapDelegateProtocol!
    
    override func setUp() {
        super.setUp()
        self.model = Model()
        self.mapDelegate = MockMapDelegateProtocol()
        self.model.mapDelegate = self.mapDelegate
    }
    
    func testClearColumns() {
        self.model.columns.append(MapColumn())
        self.model.clear()
        XCTAssertTrue(self.model.columns.isEmpty, "Not clearing")
    }
    
    func testAddColumns() {
        let columnA:MapColumn = MapColumn()
        let columnB:MapColumn = MapColumn()
        let layout:NSLayoutConstraint = NSLayoutConstraint()
        let view:ViewItem = ViewItem()
        view.layoutTop = layout
        view.layoutHeight = layout
        view.layoutLeft = layout
        view.layoutWidth = layout
        columnA.view = view
        columnB.view = view
        let columns:[MapColumn] = [columnA, columnB]
        
        self.model.add(columns:columns)
        XCTAssertEqual(columns.count, self.model.columns.count, "Not added")
    }
    
    func testAddColumnsUpdatesSize() {
        var updates:Bool = false
        self.mapDelegate.onMapChangedSize = {
            updates = true
        }
        
        self.model.add(columns:[])
        XCTAssertTrue(updates, "Not updated")
    }
    
    func testNestableColumns() {
        self.model.columns = [MockMapColumn(), MockMapColumnProtocol(), MockMapColumnProtocol(), MockMapColumn()]
        XCTAssertEqual(self.model.nestableColumns.count, 2, "Invalid number of columns")
    }
}
