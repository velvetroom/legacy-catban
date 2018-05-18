import XCTest
@testable import Home

class TestPresenterUpdaterCard:XCTestCase {
    private var presenter:PresenterUpdaterCard!
    private var viewBoard:ViewBoard!
    private var column:MockMapColumn!
    private struct Constants {
        static let identifier:String = "lorem ipsum"
        static let content:String = "hello world"
        static let height:CGFloat = 346
    }
    
    override func setUp() {
        super.setUp()
        self.presenter = PresenterUpdaterCard()
        self.column = MockMapColumn()
        self.viewBoard = ViewBoard()
        self.presenter.column = self.column
        self.presenter.viewBoard = self.viewBoard
        self.configureViewModel()
    }
    
    func testNotRetainingBoard() {
        self.presenter.viewBoard = ViewBoard()
        XCTAssertNil(self.presenter.viewBoard, "Retaining")
    }
    
    func testNotRetainingColumn() {
        self.presenter.column = MapColumn()
        XCTAssertNil(self.presenter.column, "Retaining")
    }
    
    func testUpdateAppendItem() {
        var called:Bool = false
        self.column.onAppendItem = { (item:MapItemProtocol) in
            called = true
        }
        
        self.presenter.update()
        XCTAssertTrue(called, "Not appended")
    }
    
    func testUpdateAddsLayout() {
        self.presenter.update()
        XCTAssertTrue(self.presenter.viewItem.layoutTop.isActive, "Not active")
        XCTAssertTrue(self.presenter.viewItem.layoutHeight.isActive, "Not active")
        XCTAssertTrue(self.presenter.viewItem.layoutLeft.isActive, "Not active")
        XCTAssertTrue(self.presenter.viewItem.layoutWidth.isActive, "Not active")
        XCTAssertEqual(self.presenter.viewItem.layoutWidth.constant, ViewConstants.Column.width, "Invalid width")
        XCTAssertEqual(self.presenter.viewItem.layoutHeight.constant, Constants.height, "Invalid height")
    }
    
    func testUpdateContent() {
        self.presenter.update()
        
        let viewItem:ViewCard? = self.presenter.viewItem as? ViewCard
        XCTAssertNotNil(viewItem, "Invalid view type")
        XCTAssertEqual(viewItem?.labelContent.text, Constants.content, "Missing content")
        XCTAssertEqual(viewItem?.identifier, Constants.identifier, "Missing identifier")
    }
    
    private func configureViewModel() {
        var viewModel:ViewModelCard = ViewModelCard()
        viewModel.height = Constants.height
        viewModel.content = Constants.content
        viewModel.identifier = Constants.identifier
        self.presenter.viewModel = viewModel
    }
}
