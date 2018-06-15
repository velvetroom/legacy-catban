import XCTest
@testable import Tools

class TestNamerPresenter:XCTestCase {
    private var presenter:NamerPresenter<MockNamerInteractorProtocol>!
    private var interactor:MockNamerInteractorProtocol!
    
    override func setUp() {
        super.setUp()
        self.presenter = NamerPresenter<MockNamerInteractorProtocol>()
        self.interactor = MockNamerInteractorProtocol()
        self.presenter.interactor = self.interactor
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
    
    func testSaveButtonInitiallyDisabled() {
        let view:NamerView<MockNamerInteractorProtocol> = NamerView<MockNamerInteractorProtocol>()
        view.didLoad()
        view.viewModel = NamerViewModel()
        XCTAssertFalse(view.navigationItem.rightBarButtonItem!.isEnabled, "Should not be enabled")
    }
}
