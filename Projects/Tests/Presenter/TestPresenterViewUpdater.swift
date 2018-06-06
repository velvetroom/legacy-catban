import XCTest
@testable import Projects

class TestPresenterViewUpdater:XCTestCase {
    private var presenter:PresenterViewUpdater!
    private var parentPresenter:Presenter!
    private var outlets:PresenterOutlets!
    private var viewList:ViewList!
    private var viewEmpty:ViewEmpty!
    private var viewMenu:ViewMenu!
    private var viewModel:ViewModelList!
    private var viewSelector:ViewSelector!
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
        self.viewSelector = ViewSelector()
        self.parentPresenter = Presenter()
        self.outlets.empty = self.viewEmpty
        self.outlets.list = self.viewList
        self.outlets.menu = self.viewMenu
        self.outlets.selector = self.viewSelector
        self.parentPresenter.outlets = self.outlets
        self.presenter.presenter = self.parentPresenter
    }
    
    func testUpdateViews() {
        self.updateViewModel()
        self.presenter.update()
        self.validateViews()
        self.validateList()
    }
    
    func testNotRetainingPresenter() {
        self.presenter.presenter = Presenter()
        XCTAssertNil(self.presenter.presenter, "Retains")
    }

    private func updateViewModel() {
        self.viewModel.items = self.makeItems()
        self.presenter.viewModel = self.viewModel
        self.presenter.presenter.list.view = self.viewList
    }
    
    private func makeItems() -> [ViewModelListItem] {
        var items:[ViewModelListItem] = []
        for index:Int in 0 ..< Constants.itemsCount {
            var item:ViewModelListItem = ViewModelListItem()
            item.identifier = String(index)
            items.append(item)
        }
        return items
    }
    
    private func validateViews() {
        XCTAssertEqual(self.viewList.isHidden, self.viewModel.listHidden, "Failed")
        XCTAssertEqual(self.viewSelector.isHidden, self.viewModel.selectorHidden, "Failed")
        XCTAssertEqual(self.viewEmpty.isHidden, self.viewModel.emptyHidden, "Failed")
        XCTAssertEqual(self.viewMenu.isUserInteractionEnabled, self.viewModel.menuEnabled, "Failed")
        XCTAssertEqual(self.viewMenu.alpha, self.viewModel.menuAlpha, "Failed")
        XCTAssertEqual(self.parentPresenter.list.items.count, Constants.itemsCount, "Failed")
    }
    
    private func validateList() {
        XCTAssertEqual(self.parentPresenter.list.selected.identifier, "0", "Selected id not set")
        XCTAssertNotNil(self.parentPresenter.list.view, "Not injected")
    }
}
