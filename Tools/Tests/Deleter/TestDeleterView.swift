import XCTest
@testable import Tools

class TestDeleterView:XCTestCase {
    private var interactor:MockDeleterInteractorProtocol!
    private var deleter:DeleterView<MockDeleterInteractorProtocol>!
    private var presenter:MockDeleterPresenter!
    private var transition:MockTransitionProtocol!
    
    override func setUp() {
        super.setUp()
        self.interactor = MockDeleterInteractorProtocol()
        self.deleter = DeleterFactory.makeWith(
            interactor:self.interactor, and:DeleterViewModel()) as! DeleterView<MockDeleterInteractorProtocol>
        self.presenter = MockDeleterPresenter()
        self.transition = MockTransitionProtocol()
        self.presenter.viewModel = self.deleter.presenter.viewModel
        self.presenter.interactor = self.deleter.presenter.interactor
        self.deleter.presenter = self.presenter
        self.deleter.transition = self.transition
        self.presenter.view = self.deleter
        XCTAssertNotNil(self.deleter.view, "Loading view")
        self.deleter.view.frame = CGRect(x:0, y:0, width:100, height:100)
    }
    
    func testCancelCloseDeleter() {
        let expect:XCTestExpectation = self.expectation(description:String())
        var closed:Bool = false
        self.transition.onDimiss = {
            closed = true
            expect.fulfill()
        }
        self.deleter.selectorCancel()
        self.waitForExpectations(timeout:0.5) { (error:Error?) in XCTAssertTrue(closed, "Failed to close") }
    }
    
    func testCancelCallsPresenter() {
        let expect:XCTestExpectation = self.expectation(description:String())
        var called:Bool = false
        self.presenter.onCancel = {
            called = true
            expect.fulfill()
        }
        self.deleter.selectorCancel()
        self.waitForExpectations(timeout:0.5) { (error:Error?) in XCTAssertTrue(called, "Failed to call presenter") }
    }
    
    func testConfirmCloseDeleter() {
        let expect:XCTestExpectation = self.expectation(description:String())
        var closed:Bool = false
        self.transition.onDimiss = {
            closed = true
            expect.fulfill()
        }
        self.deleter.selectorConfirm()
        self.waitForExpectations(timeout:0.5) { (error:Error?) in XCTAssertTrue(closed, "Failed to close") }
    }
    
    func testConfirmCallsPresenter() {
        let expect:XCTestExpectation = self.expectation(description:String())
        var called:Bool = false
        self.presenter.onConfirm = {
            called = true
            expect.fulfill()
        }
        self.deleter.selectorConfirm()
        self.waitForExpectations(timeout:0.5) { (error:Error?) in XCTAssertTrue(called, "Failed to call presenter") }
    }
    
    func testOrientationChangedUpdatesFrame() {
        let size:CGSize = CGSize(width:345, height:124)
        self.deleter.orientationChanged(size:size)
        XCTAssertEqual(self.deleter.content.frame.size, size, "Failes to update frame")
    }
    
    func testUpdateViewModel() {
        var viewModel:DeleterViewModel = DeleterViewModel()
        viewModel.name = "lorem ipsum"
        viewModel.title = "hello world"
        self.deleter.viewModel.update(property:viewModel)
        XCTAssertEqual(self.deleter.content.viewMenu.labelTitle.text, viewModel.title, "Not updated")
        XCTAssertEqual(self.deleter.content.viewMenu.labelName.text, viewModel.name, "Not updated")
    }
}
