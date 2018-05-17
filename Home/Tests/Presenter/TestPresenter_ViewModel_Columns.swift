import XCTest
@testable import Home

class TestPresenter_ViewModel_Columns:XCTestCase {
    private var presenter:Presenter!
    private var viewModel:ViewModel!
    private var viewBoard:ViewBoard!
    private var viewScroll:ViewScroll!
    private struct Constants {
        static let initialColumns:Int = 2
        static let finalColumns:Int = 1
        static let columnName:String = "lorem ipsum"
    }
    
    override func setUp() {
        super.setUp()
        self.presenter = Presenter()
        self.viewModel = ViewModel()
        self.viewBoard = ViewBoard()
        self.viewScroll = ViewScroll()
        self.presenter.outlets.viewBoard = self.viewBoard
        self.presenter.outlets.viewScroll = self.viewScroll
    }
    
    func testLoad() {
        XCTAssertNotNil(self.presenter, "Failed to load presenter")
        XCTAssertNotNil(self.viewModel, "Failed to load view model")
        XCTAssertNotNil(self.viewBoard, "Failed to load view board")
    }
    
    func testReloadColumns() {
        self.updatePresenterWith(columns:Constants.initialColumns)
        
        XCTAssertEqual(self.viewBoard.subviews.count, Constants.initialColumns, "Invalid amount of subviews")
        self.validateColumns()
        
        self.updatePresenterWith(columns:Constants.finalColumns)
        
        XCTAssertEqual(self.viewBoard.subviews.count, Constants.finalColumns, "Invalid amount of subviews")
        self.validateColumns()
    }
    
    private func updatePresenterWith(columns:Int) {
        self.viewModel.columns = []
        for _:Int in 0 ..< columns {
            var column:ViewModelColumn = ViewModelColumn()
            column.name = Constants.columnName
            self.viewModel.columns.append(column)
        }
        self.presenter.updateWith(viewModel:self.viewModel)
    }
    
    private func validateColumns() {
        for view:UIView in self.viewBoard.subviews {
            guard
                let column:ViewColumn = view as? ViewColumn
            else { break }
            XCTAssertEqual(column.superview, self.viewBoard, "Failed to assign superview")
            XCTAssertNotNil(column.layoutLeft, "Failed to assign layout")
            XCTAssertEqual(column.labelName.text, Constants.columnName, "Failed to assign name")
        }
    }
}
