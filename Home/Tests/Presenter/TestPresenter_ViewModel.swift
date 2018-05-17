import XCTest
@testable import Home

class TestPresenter_ViewModel:XCTestCase {
    private var presenter:Presenter!
    private var viewModel:ViewModel!
    private var viewBoard:ViewBoard!
    private var viewScroll:ViewScroll!
    
    override func setUp() {
        super.setUp()
        self.presenter = Presenter()
        self.viewModel = ViewModel()
        self.viewBoard = ViewBoard()
        self.viewScroll = ViewScroll()
        self.presenter.outlets.viewBoard = self.viewBoard
        self.presenter.outlets.viewScroll = self.viewScroll
    }
    
    func testUpdateTitle() {
        let title:String = "hello world"
        let view:View = View()
        self.presenter.outlets.view = view
        self.viewModel.view.title = title
        
        self.presenter.updateWith(viewModel:self.viewModel)
        
        XCTAssertEqual(view.title, title, "Failed to update title")
    }
    
    func testUpdateColumns() {
        let columns:[ViewModelColumn] = [ViewModelColumn(), ViewModelColumn()]
        let viewBoard:ViewBoard = ViewBoard()
        self.presenter.outlets.viewBoard = viewBoard
        self.viewModel.columns = columns
        
        self.presenter.updateWith(viewModel:self.viewModel)
        
        XCTAssertEqual(viewBoard.subviews.count, columns.count, "Failed to update columns")
    }
    
    func testUpdateCards() {
        let cards:[ViewModelCard] = [ViewModelCard(), ViewModelCard()]
        var column:ViewModelColumn = ViewModelColumn()
        column.items = cards
        let viewBoard:ViewBoard = ViewBoard()
        self.presenter.outlets.viewBoard = viewBoard
        self.viewModel.columns = [column]
        
        self.presenter.updateWith(viewModel:self.viewModel)
        
        XCTAssertEqual(viewBoard.subviews.count, cards.count + 1, "Failed to update cards")
    }
}
