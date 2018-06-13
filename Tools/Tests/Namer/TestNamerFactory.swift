import XCTest
import Shared
@testable import Tools

class TestNamerFactory:XCTestCase {
    func testInjectsViewModel() {
        var viewModel:NamerViewModel = NamerViewModel()
        viewModel.currentName = "lorem ipsum"
        let view:PresentingViewProtocol = NamerFactory.makeNamerWith(interactor:MockNamerInteractorProtocol(),
                                                                     and:viewModel)
        let namer:NamerView<MockNamerInteractorProtocol> = view as! NamerView<MockNamerInteractorProtocol>
        XCTAssertEqual(namer.presenter.viewModel.currentName, viewModel.currentName, "Not injected")
    }
    
    func testInjectsInteractor() {
        let interactor:MockNamerInteractorProtocol = MockNamerInteractorProtocol()
        let view:PresentingViewProtocol = NamerFactory.makeNamerWith(interactor:interactor, and:NamerViewModel())
        let namer:NamerView<MockNamerInteractorProtocol> = view as! NamerView<MockNamerInteractorProtocol>
        XCTAssertTrue(namer.presenter.interactor === interactor, "Failed to inject interactor")
    }
    
    func testNotInjectingPresenterOnInteractor() {
        let interactor:MockNamerInteractorProtocol = MockNamerInteractorProtocol()
        let view:PresentingViewProtocol = NamerFactory.makeNamerWith(interactor:interactor, and:NamerViewModel())
        let _:NamerView<MockNamerInteractorProtocol> = view as! NamerView<MockNamerInteractorProtocol>
        XCTAssertNil(interactor.presenter, "Injecting")
    }
}
