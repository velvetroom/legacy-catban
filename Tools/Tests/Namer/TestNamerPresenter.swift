import XCTest
@testable import Tools

class TestNamerPresenter:XCTestCase {
    private var view:NamerView<MockNamerInteractorProtocol>!
    private var presenter:NamerPresenter<MockNamerInteractorProtocol>!
    private var interactor:MockNamerInteractorProtocol!
    
    override func setUp() {
        super.setUp()
        self.view = NamerView<MockNamerInteractorProtocol>()
        self.presenter = self.view.presenter
        self.interactor = MockNamerInteractorProtocol()
        self.presenter.interactor = self.interactor
        self.view.didLoad()
        self.presenter.viewModel = NamerViewModel()
    }
    
    func testCallsInteractorOnSave() {
        var called:Bool = false
        let name:String = "lorem ipsum"
        self.interactor.onNamerFinished = { (updatedName:String) in
            XCTAssertEqual(updatedName, name, "Invalid name received")
            called = true
        }
        self.presenter.saveWith(name:name)
        XCTAssertTrue(called, "Not called")
    }
    
    func testCallsInteractorOnCancel() {
        var called:Bool = false
        self.interactor.onNamerCancelled = { called = true }
        self.presenter.cancel()
        XCTAssertTrue(called, "Not called")
    }
    
    func testSaveButtonInitiallyDisabled() {
        XCTAssertFalse(view.navigationItem.rightBarButtonItem!.isEnabled, "Should not be enabled")
    }
    
    func testValidateNameWithError() {
        let _:Bool = self.presenter.textField(self.view.content.viewField, shouldChangeCharactersIn:NSMakeRange(0, 0),
                                              replacementString:String())
        XCTAssertFalse(self.view.viewModel.state.saveEnabled, "Not validated")
        XCTAssertFalse(self.view.viewModel.state.message.isEmpty, "Not validated")
        XCTAssertTrue(self.view.viewModel.state.statusValidHidden, "Not validated")
        XCTAssertFalse(self.view.viewModel.state.statusErrorHidden, "Not validated")
    }
    
    func testValidateNameWithSuccess() {
        self.view.content.viewField.text = "lorem ipsum"
        let _:Bool = self.presenter.textField(self.view.content.viewField, shouldChangeCharactersIn:NSMakeRange(0, 0),
                                              replacementString:String())
        XCTAssertTrue(self.view.viewModel.state.saveEnabled, "Not validated")
        XCTAssertTrue(self.view.viewModel.state.message.isEmpty, "Not validated")
        XCTAssertFalse(self.view.viewModel.state.statusValidHidden, "Not validated")
        XCTAssertTrue(self.view.viewModel.state.statusErrorHidden, "Not validated")
    }
    
}
