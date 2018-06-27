import XCTest
import CleanArchitecture
@testable import Tools

class TestNamerFactory:XCTestCase {
    func testInjectsViewModel() {
        var viewModel:NamerViewModelContent = NamerViewModelContent()
        viewModel.currentName = "lorem ipsum"
        let view:ViewProtocol = NamerFactory.makeWith(interactor:MockNamerInteractorProtocol(),
                                                                     and:viewModel)
        let namer:NamerView<MockNamerInteractorProtocol> = view as! NamerView<MockNamerInteractorProtocol>
        let property:NamerViewModelContent? = namer.presenter.viewModel.property()
        XCTAssertNotNil(property, "Not injected")
        XCTAssertEqual(property?.currentName, viewModel.currentName, "Not injected")
    }
    
    func testInjectsInteractor() {
        let interactor:MockNamerInteractorProtocol = MockNamerInteractorProtocol()
        let view:ViewProtocol = NamerFactory.makeWith(interactor:interactor, and:NamerViewModelContent())
        let namer:NamerView<MockNamerInteractorProtocol> = view as! NamerView<MockNamerInteractorProtocol>
        XCTAssertTrue(namer.presenter.interactor === interactor, "Failed to inject interactor")
    }
    
    func testNotInjectingPresenterOnInteractor() {
        let interactor:MockNamerInteractorProtocol = MockNamerInteractorProtocol()
        let view:ViewProtocol = NamerFactory.makeWith(interactor:interactor, and:NamerViewModelContent())
        let _:NamerView<MockNamerInteractorProtocol> = view as! NamerView<MockNamerInteractorProtocol>
        XCTAssertNil(interactor.presenter, "Injecting")
    }
}
