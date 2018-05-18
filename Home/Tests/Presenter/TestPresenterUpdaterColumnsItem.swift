import XCTest
@testable import Home

class TestPresenterUpdaterColumnsItem:XCTestCase {
    private var presenter:PresenterUpdaterColumnsItem!
    private var map:MockMapProtocol!
    private var viewBoard:ViewBoard!
    private struct Constants {
        static let name:String = "lorem ipsum"
    }
    
    override func setUp() {
        super.setUp()
        self.presenter = PresenterUpdaterColumnsItem()
        self.map = MockMapProtocol()
        self.presenter.viewModel = ViewModelColumn()
        self.viewBoard = ViewBoard()
        self.presenter.viewBoard = self.viewBoard
        self.presenter.map = self.map
        self.presenter.viewModel.name = Constants.name
    }
    
    func testNotRetainingMap() {
        self.presenter.map = MockMapProtocol()
        XCTAssertNil(self.presenter.map, "Retains")
    }
    
    func testNotRetainingView() {
        self.presenter.viewBoard = ViewBoard()
        XCTAssertNil(self.presenter.viewBoard, "Retains")
    }
    
    func testUpdateAddsColumn() {
        var called:Bool = false
        self.map.onAddColumn = { (column:MapColumn) in
            called = true
        }
        
        self.presenter.update()
        XCTAssertTrue(called, "Not added")
    }
    
    func testUpdateAddsView() {
        self.presenter.update()
        let view:ViewColumn? = self.viewBoard.subviews.first as? ViewColumn
        XCTAssertNotNil(view, "Failed to add column")
        if let view:ViewColumn = view {
            self.validate(view:view)
        }
    }
    
    private func validate(view:ViewColumn) {
        XCTAssertEqual(view.labelName.text, Constants.name, "Name not updated")
        XCTAssertTrue(view.layoutTop.isActive, "Constraint not set")
        XCTAssertTrue(view.layoutLeft.isActive, "Constraint not set")
        XCTAssertTrue(view.layoutHeight.isActive, "Constraint not set")
        XCTAssertTrue(view.layoutWidth.isActive, "Constraint not set")
        XCTAssertEqual(view.layoutWidth.constant, ViewConstants.Column.width, "Invalid width")
        XCTAssertEqual(view.layoutHeight.constant, ViewConstants.ColumnTitle.height, "Invalid height")
    }
}
