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
        XCTAssertNotNil(self.view.presenter.viewStatus, "Not referenced")
        XCTAssertNotNil(self.view.presenter.labelError, "Not referenced")
        XCTAssertNotNil(self.view.presenter.buttonSave, "Not referenced")
        XCTAssertNotNil(self.view.content.viewField.delegate, "Not assigned")
    }
    
    func testAssignsDelegateToField() {
        self.view.didLoad()
        XCTAssertNotNil(self.view.content.viewField.delegate, "Not assigned")
    }
    
    func testUpdatesFieldWithName() {
        let currentName:String = "hello world"
        self.view.presenter.viewModel.currentName = currentName
        self.view.didLoad()
        XCTAssertEqual(self.view.content.viewField.text!, currentName, "Not updated")
    }
    
    func testStatusInitiallyHidden() {
        self.view.didLoad()
        XCTAssertTrue(self.view.content.viewStatus.isHidden, "Status should initially be hidden")
    }
}
