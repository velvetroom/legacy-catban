import XCTest
@testable import Home

class TestPresenterUpdaterBoardItems:XCTestCase {
    private var presenter:PresenterUpdaterBoardItems!
    private var viewBoard:ViewBoard!
    private var controller:Controller!
    private var drag:Map!
    private struct Constants {
        static let itemTop:CGFloat = 24
    }
    
    override func setUp() {
        super.setUp()
        self.presenter = PresenterUpdaterBoardItems()
        self.controller = Controller()
        self.viewBoard = ViewBoard()
        self.presenter.viewModel = ViewModel()
        self.presenter.outlets = PresenterOutlets()
        self.drag = Map()
        self.presenter.controller = self.controller
        self.presenter.outlets.viewBoard = self.viewBoard
        self.presenter.drag = self.drag
        self.configureViewModel()
        self.presenter.update()
    }
    
    func testUpdateInstantiatesUpdater() {
        XCTAssertNotNil(MockPresenterUpdaterBoardItemProtocol.updater, "Failed to call update")
    }
    
    func testInjectsController() {
        XCTAssertNotNil(MockPresenterUpdaterBoardItemProtocol.updater?.controller, "Failed")
    }
    
    func testInjectsBoard() {
        XCTAssertNotNil(MockPresenterUpdaterBoardItemProtocol.updater?.viewBoard, "Failed")
    }
    
    func testInjectsViewModel() {
        let top:CGFloat? = MockPresenterUpdaterBoardItemProtocol.updater?.viewModel.top
        XCTAssertNotNil(top, "Failed")
        XCTAssertEqual(top, Constants.itemTop, "Failed")
    }
    
    func testInjectsDrag() {
        XCTAssertNotNil(MockPresenterUpdaterBoardItemProtocol.updater?.drag, "Failed")
    }
    
    private func configureViewModel() {
        let item:MockViewModelBoardItemProtocol = MockViewModelBoardItemProtocol()
        item.top = Constants.itemTop
        let identifier:ObjectIdentifier = ObjectIdentifier(MockViewModelBoardItemProtocol.self)
        self.presenter.updaterMap[identifier] = MockPresenterUpdaterBoardItemProtocol.self
        self.presenter.viewModel.items.append(item)
    }
}
