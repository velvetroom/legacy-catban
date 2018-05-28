import XCTest
@testable import Projects

class TestPresenterViewUpdater:XCTestCase {
    private var presenter:PresenterViewUpdater!
    private var outlets:PresenterOutlets!
    private var viewList:ViewList!
    private var viewEmpty:ViewEmpty!
    private var viewMenu:ViewMenu!
    private var viewModel:ViewModelList!
    private struct Constants {
        static let itemsCount:Int = 3
    }
    
    override func setUp() {
        super.setUp()
        self.presenter = PresenterViewUpdater()
        self.outlets = PresenterOutlets()
        self.viewList = ViewList()
        self.viewEmpty = ViewEmpty()
        self.viewMenu = ViewMenu()
        self.viewModel = ViewModelList()
        self.outlets.empty = self.viewEmpty
        self.outlets.list = self.viewList
        self.outlets.menu = self.viewMenu
        self.presenter.outlets = self.outlets
    }
    
    func testUpdateViews() {
        self.updateViewModel()
        self.presenter.update()
        self.validateViews()
    }

    private func updateViewModel() {
        self.viewModel.items = self.makeItems()
        self.presenter.viewModel = self.viewModel
    }
    
    private func makeItems() -> [ViewModelListItem] {
        var items:[ViewModelListItem] = []
        for _:Int in 0 ..< Constants.itemsCount {
            items.append(ViewModelListItem())
        }
        return items
    }
    
    private func validateViews() {
        XCTAssertEqual(self.viewList.isHidden, self.viewModel.listHidden, "Failed")
        XCTAssertEqual(self.viewEmpty.isHidden, self.viewModel.emptyHidden, "Failed")
        XCTAssertEqual(self.viewMenu.isUserInteractionEnabled, self.viewModel.menuEnabled, "Failed")
        XCTAssertEqual(self.viewMenu.alpha, self.viewModel.menuAlpha, "Failed")
        XCTAssertEqual(self.viewList.presenter.items.count, Constants.itemsCount, "Failed")
    }
}
