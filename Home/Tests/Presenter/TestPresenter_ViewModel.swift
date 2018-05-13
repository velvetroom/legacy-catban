import XCTest
@testable import Home

class TestPresenter_ViewModel:XCTestCase {
    private var presenter:Presenter!
    private var viewModel:ViewModel!
    private var viewBoard:ViewBoard!
    
    override func setUp() {
        super.setUp()
        self.presenter = Presenter()
        self.viewModel = ViewModel()
        self.viewBoard = ViewBoard()
        self.presenter.outlets.viewBoard = self.viewBoard
    }
    
    func testUpdateTitle() {
        let title:String = "hello world"
        let view:View = View()
        self.presenter.outlets.view = view
        self.viewModel.view.title = title
        
        self.presenter.updateWith(viewModel:self.viewModel)
        
        XCTAssertEqual(view.title, title, "Failed to update title")
    }
    
    func testUpdateScrollContentSize() {
        let size:CGSize = CGSize(width:10, height:10)
        let viewScroll:ViewScroll = ViewScroll()
        self.presenter.outlets.viewScroll = viewScroll
        self.viewModel.scroll.contentSize = size
        
        self.presenter.updateWith(viewModel:self.viewModel)
        
        XCTAssertEqual(viewScroll.contentSize, size, "Failed to update content size")
    }
    
    func testUpdateBoardContentSize() {
        let frame:CGRect = CGRect(x:12, y:23, width:34, height:45)
        let viewBoard:ViewBoard = ViewBoard()
        self.presenter.outlets.viewBoard = viewBoard
        self.viewModel.board.frame = frame
        
        self.presenter.updateWith(viewModel:self.viewModel)
        
        XCTAssertEqual(viewBoard.frame, frame, "Failed to update board frame")
    }
    
    func testUpdateColumns() {
        let columns:[ViewModelColumn] = [ViewModelColumn(), ViewModelColumn()]
        let viewBoard:ViewBoard = ViewBoard()
        self.presenter.outlets.viewBoard = viewBoard
        self.viewModel.columns = columns
        
        self.presenter.updateWith(viewModel:self.viewModel)
        
        XCTAssertEqual(viewBoard.columns.count, columns.count, "Failed to update columns")
    }
    
    func testUpdateCards() {
        let cards:[ViewModelCard] = [ViewModelCard(), ViewModelCard()]
        let viewBoard:ViewBoard = ViewBoard()
        self.presenter.outlets.viewBoard = viewBoard
        self.viewModel.items = cards
        
        self.presenter.updateWith(viewModel:self.viewModel)
        
        XCTAssertEqual(viewBoard.items.count, cards.count, "Failed to update cards")
    }
}
