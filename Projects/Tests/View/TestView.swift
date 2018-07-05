import XCTest
@testable import Projects

class TestView:XCTestCase {
    private var view:View!
    private var viewList:MockViewList!
    private var presenter:MockPresenter!
    private var interactor:MockInteractor!
    
    override func setUp() {
        super.setUp()
        self.view = View()
        self.presenter = MockPresenter()
        self.interactor = MockInteractor()
        self.presenter.interactor = self.interactor
        self.viewList = MockViewList()
        self.view.presenter = self.presenter
        self.view.content.viewList = self.viewList
    }
    
    func testUpdateListLayoutOnOrientationChange() {
        var called:Bool = false
        self.viewList.onUpdateLayout = { called = true }
        self.view.orientationChanged(size:CGSize.zero)
        XCTAssertTrue(called, "Not called")
    }
    
    func testCallsPresenterOnOpen() {
        var called:Bool = false
        self.presenter.onOpen = { called = true }
        self.view.selectorOpen()
        XCTAssertTrue(called, "Not called")
    }
    
    func testCallsPresenterOnOpenCloud() {
        var called:Bool = false
        self.presenter.onOpenCloud = { called = true }
        self.view.selectorCloud()
        XCTAssertTrue(called, "Not called")
    }
    
    func testCallsPresenterAddProject() {
        var called:Bool = false
        self.presenter.onAddProject = { called = true }
        self.view.selectorAddProject()
        XCTAssertTrue(called, "Not called")
    }
    
    func testCallsPresenterOnRename() {
        var called:Bool = false
        self.presenter.onRename = { called = true }
        self.view.selectorRename()
        XCTAssertTrue(called, "Not called")
    }
    
    func testCallsPresenterOnDelete() {
        var called:Bool = false
        self.presenter.onDelete = { called = true }
        self.view.selectorDelete()
        XCTAssertTrue(called, "Not called")
    }
}
