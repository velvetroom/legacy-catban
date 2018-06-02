import XCTest
@testable import Projects

class TestPresenterDelegater:XCTestCase {
    private var presenter:PresenterDelegater!
    private var parentPresenter:Presenter!
    private var viewList:ViewList!
    private var viewRenamer:ViewRenamer!
    
    override func setUp() {
        super.setUp()
        self.presenter = PresenterDelegater()
        self.parentPresenter = Presenter()
        self.viewList = ViewList()
        self.viewRenamer = ViewRenamer()
        self.parentPresenter.outlets.list = self.viewList
        self.parentPresenter.outlets.renamer = self.viewRenamer
        self.presenter.presenter = self.parentPresenter
        self.presenter.inject()
    }
    
    func testNotRetainingPresenter() {
        self.presenter.presenter = Presenter()
        XCTAssertNil(self.presenter.presenter, "Retains")
    }
    
    func testInjectsListDelegate() {
        XCTAssertNotNil(self.viewList.delegate, "Not injected")
        XCTAssertNotNil(self.viewList.dataSource, "Not injected")
        XCTAssertNotNil(self.parentPresenter.list.view, "Not injected")
    }
    
    func testInjectsRenamer() {
        XCTAssertNotNil(self.parentPresenter.renamer.view, "Not injected")
    }
}
