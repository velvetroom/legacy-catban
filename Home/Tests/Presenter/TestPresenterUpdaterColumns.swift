import XCTest
@testable import Home

class TestPresenterUpdaterColumns:XCTestCase {
    private var presenter:PresenterUpdaterColumns!
    private var view:MockViewBoard!
    private var map:MockMapProtocol!
    
    override func setUp() {
        super.setUp()
        self.presenter = PresenterUpdaterColumns()
        self.view = MockViewBoard()
        self.map = MockMapProtocol()
        self.presenter.viewModel = ViewModel()
        self.presenter.outlets = PresenterOutlets()
        self.presenter.outlets.viewBoard = self.view
        self.presenter.map = self.map
    }
    
    func testUpdateRemovesSubviews() {
        var called:Bool = false
        self.view.onRemoveSubviews = {
            called = true
        }
        
        self.presenter.update()
        XCTAssertTrue(called, "Not removed")
    }
    
    func testUpdateContentSize() {
        var called:Bool = false
        self.map.onUpdateContentSize = {
            called = true
        }
        
        self.presenter.update()
        XCTAssertTrue(called, "Not updated")
    }
    
    func testAddColumnsToMap() {
        self.configureViewModel()
        var countAddedColumns:Int = 0
        self.map.onAddColumn = { (column:MapColumn) in
            countAddedColumns += 1
        }
        
        self.presenter.update()
        XCTAssertEqual(countAddedColumns, self.presenter.viewModel.columns.count, "Invalid number of columns")
    }
    
    func testAddSubviews() {
        self.configureViewModel()
        XCTAssertTrue(self.view.subviews.isEmpty, "Must be empty")
        
        self.presenter.update()
        XCTAssertEqual(self.view.subviews.count, self.presenter.viewModel.columns.count, "Invalid number of views")
    }
    
    func testNotRetainingMap() {
        self.presenter.map = MockMapProtocol()
        XCTAssertNil(self.presenter.map, "Retains")
    }
    
    func testNotRetainingView() {
        self.presenter.viewBoard = ViewBoard()
        XCTAssertNil(self.presenter.viewBoard, "Retains")
    }
    
    private func configureViewModel() {
        self.presenter.viewModel.columns.append(ViewModelColumn())
        self.presenter.viewModel.columns.append(ViewModelColumn())
    }
}
