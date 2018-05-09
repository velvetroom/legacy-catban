import XCTest
@testable import Home

class TestPresenter_ViewModel_Columns:XCTestCase {
    private var presenter:Presenter!
    private var viewModel:ViewModel!
    private var viewBoard:ViewBoard!
    private struct Constants {
        static let initialColumns:Int = 2
        static let finalColumns:Int = 1
        static let columnName:String = "lorem ipsum"
        static let layoutConstant:CGFloat = 3
    }
    
    override func setUp() {
        super.setUp()
        self.presenter = Presenter()
        self.viewModel = ViewModel()
        self.viewBoard = ViewBoard()
        self.presenter.outlets.viewBoard = self.viewBoard
    }
    
    func testLoad() {
        XCTAssertNotNil(self.presenter, "Failed to load presenter")
        XCTAssertNotNil(self.viewModel, "Failed to load view model")
        XCTAssertNotNil(self.viewBoard, "Failed to load view board")
    }
    
    func testReloadColumns() {
        self.configureViewModelWith(columns:Constants.initialColumns)
        self.presenter.updateWith(viewModel:self.viewModel)
        
        XCTAssertEqual(self.viewBoard.columns.count, Constants.initialColumns, "Invalid amount of columns")
        XCTAssertEqual(self.viewBoard.subviews.count, Constants.initialColumns, "Invalid amount of subviews")
        self.validateColumns()
        
        self.configureViewModelWith(columns:Constants.finalColumns)
        self.presenter.updateWith(viewModel:self.viewModel)
        
        XCTAssertEqual(self.viewBoard.columns.count, Constants.finalColumns, "Invalid amount of columns")
        XCTAssertEqual(self.viewBoard.subviews.count, Constants.finalColumns, "Invalid amount of subviews")
        self.validateColumns()
    }
    
    private func configureViewModelWith(columns:Int) {
        self.viewModel.columns = []
        for _:Int in 0 ..< columns {
            var column:ViewModelColumn = ViewModelColumn()
            column.name = Constants.columnName
            column.left = Constants.layoutConstant
            self.viewModel.columns.append(column)
        }
    }
    
    private func validateColumns() {
        for column:ViewColumn in self.viewBoard.columns {
            XCTAssertEqual(column.superview, self.viewBoard, "Failed to assign superview")
            XCTAssertNotNil(column.layoutLeft, "Failed to assign layout")
            XCTAssertEqual(column.layoutLeft.constant, Constants.layoutConstant, "Failed to assign constant")
            XCTAssertEqual(column.labelName.text, Constants.columnName, "Failed to assign name")
        }
    }
}
