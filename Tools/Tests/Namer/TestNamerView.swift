import XCTest
@testable import Tools

class TestNamerView:XCTestCase {
    private var interactor:MockNamerInteractorProtocol!
    private var view:NamerView<MockNamerInteractorProtocol>!
    
    override func setUp() {
        super.setUp()
        self.view = NamerView<MockNamerInteractorProtocol>()
        self.view.presenter.viewModel = NamerViewModel()
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
    
    func testUpdatesViewModel() {
        XCTAssertNotNil(self.view.view, "Loading view failed")
        var viewModel:NamerViewModel = NamerViewModel()
        viewModel.currentName = "lorem ipsum"
        viewModel.title = "hello world"
        viewModel.state.message = "the world is not enough"
        viewModel.state.saveEnabled = true
        viewModel.state.statusErrorHidden = false
        viewModel.state.statusValidHidden = false
        self.view.viewModel = viewModel
        
        XCTAssertNotEqual(viewModel.currentName, self.view.content.viewField.text, "Should not updated")
        XCTAssertNotEqual(viewModel.title, self.view.title, "Should not updated")
        XCTAssertEqual(viewModel.state.message, self.view.content.labelMessage.text, "Not updated")
        XCTAssertEqual(viewModel.state.saveEnabled, self.view.navigationItem.rightBarButtonItem?.isEnabled,
                       "Not updated")
        XCTAssertEqual(viewModel.state.statusErrorHidden, self.view.content.viewStatus.statusError.isHidden,
                       "Not updated")
        XCTAssertEqual(viewModel.state.statusValidHidden, self.view.content.viewStatus.statusValid.isHidden,
                       "Not updated")
    }
    
    func testUpdatesInitialViewModel() {
        XCTAssertNotNil(self.view.view, "Loading view failed")
        var viewModel:NamerViewModel = NamerViewModel()
        viewModel.currentName = "lorem ipsum"
        viewModel.title = "hello world"
        self.view.viewModel = viewModel
        self.view.didLoad()
        
        XCTAssertEqual(viewModel.currentName, self.view.content.viewField.text, "Not updated")
        XCTAssertEqual(viewModel.title, self.view.title, "Not updated")
    }
}
