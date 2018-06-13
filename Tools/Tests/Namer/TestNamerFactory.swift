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
}
