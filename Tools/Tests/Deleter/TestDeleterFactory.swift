import XCTest
import Shared
@testable import Tools

class TestDeleterFactory:XCTestCase {
    func testInjectsDependencies() {
        let interactor:MockDeleterInteractorProtocol = MockDeleterInteractorProtocol()
        var viewModel:DeleterViewModel = DeleterViewModel()
        viewModel.title = "lorem ipsum"
        let deleter:ViewProtocol = DeleterFactory.makeWith(interactor:interactor, and:viewModel)
        let deleterView:DeleterView<MockDeleterInteractorProtocol>? = deleter as? DeleterView<MockDeleterInteractorProtocol>
        
        XCTAssertNotNil(deleterView, "Invalid type")
        XCTAssertNotNil(deleterView?.presenter, "Not injected")
        XCTAssertNotNil(deleterView?.presenter.interactor, "Not injected")
        XCTAssertNotNil(deleterView?.viewModel, "Not injected")
        
        let property:DeleterViewModel? = deleterView?.viewModel.property()
        XCTAssertNotNil(property, "Failed to load property")
        XCTAssertEqual(property?.title, viewModel.title, "Invalid property")
    }
}
