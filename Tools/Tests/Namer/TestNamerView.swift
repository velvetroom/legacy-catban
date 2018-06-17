import XCTest
@testable import Tools

class TestNamerView:XCTestCase {
    private var view:NamerView<MockNamerInteractorProtocol>!
    
    override func setUp() {
        super.setUp()
        self.view = NamerView<MockNamerInteractorProtocol>()
    }
    
    func testReferenceOutletsForPresenter() {
        self.view.didLoad()
        XCTAssertNotNil(self.view.content.viewField.delegate, "Not assigned")
    }
    
    func testStatusInitiallyHidden() {
        self.view.didLoad()
        XCTAssertTrue(self.view.content.viewStatus.statusError.isHidden, "Status should initially be hidden")
        XCTAssertTrue(self.view.content.viewStatus.statusValid.isHidden, "Status should initially be hidden")
    }
    
    func testUpdatesStateViewModel() {
        XCTAssertNotNil(self.view.view, "Loading view failed")
        var viewModel:NamerViewModelState = NamerViewModelState()
        viewModel.message = "the world is not enough"
        viewModel.saveEnabled = true
        viewModel.statusErrorHidden = false
        viewModel.statusValidHidden = false
        self.view.presenter.viewModel.update(property:viewModel)
        XCTAssertEqual(viewModel.message, self.view.content.labelMessage.text, "Not updated")
        XCTAssertEqual(viewModel.saveEnabled, self.view.navigationItem.rightBarButtonItem?.isEnabled, "Not updated")
        XCTAssertEqual(viewModel.statusErrorHidden, self.view.content.viewStatus.statusError.isHidden, "Not updated")
        XCTAssertEqual(viewModel.statusValidHidden, self.view.content.viewStatus.statusValid.isHidden, "Not updated")
    }
    
    func testUpdatesContentViewModel() {
        XCTAssertNotNil(self.view.view, "Loading view failed")
        var viewModel:NamerViewModelContent = NamerViewModelContent()
        viewModel.currentName = "lorem ipsum"
        viewModel.title = "hello world"
        self.view.presenter.viewModel.update(property:viewModel)
        XCTAssertEqual(viewModel.currentName, self.view.content.viewField.text, "Not updated")
        XCTAssertEqual(viewModel.title, self.view.title, "Not updated")
    }
}
