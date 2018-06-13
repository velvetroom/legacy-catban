import XCTest
@testable import Shared

class TestPresenterFactory:XCTestCase {
    func testInjectReferencesOnViewAndPresenter() {
        let presenter:MockPresenterProtocol = PresenterFactory.makePresenter()
        XCTAssertNotNil(presenter.interactor, "Not injected")
        XCTAssertNotNil(presenter.interactor.presenter, "Not injected")
    }
}
