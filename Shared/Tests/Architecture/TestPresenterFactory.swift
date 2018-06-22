import XCTest
@testable import Shared

class TestPresenterFactory:XCTestCase {
    func testInjectsReferencesOnViewAndPresenter() {
        let presenter:MockPresenterProtocol = PresenterFactory.makePresenter()
        XCTAssertNotNil(presenter.interactor, "Not injected")
        XCTAssertNotNil(presenter.interactor.presenter, "Not injected")
        XCTAssertNil(presenter.viewModel, "View model should not be set")
    }
}
