import XCTest
@testable import Home

class TestPresenter_Updaters:XCTestCase {
    private var presenter:Presenter!
    private var controller:Controller!
    
    override func setUp() {
        super.setUp()
        self.presenter = Presenter()
        self.controller = Controller()
        self.presenter.controller = self.controller
        self.presenter.updaters.append(MockPresenterUpdaterProtocol.self)
    }
    
    func testUpdatesAll() {
        self.presenter.updateWith(viewModel:ViewModel())
        XCTAssertNotNil(MockPresenterUpdaterProtocol.updated, "Not updated")
        XCTAssertNotNil(MockPresenterUpdaterProtocol.updated.viewModel, "Not injected")
        XCTAssertNotNil(MockPresenterUpdaterProtocol.updated.outlets, "Not injected")
        XCTAssertNotNil(MockPresenterUpdaterProtocol.updated.controller, "Not injected")
        XCTAssertNotNil(MockPresenterUpdaterProtocol.updated.drag, "Not injected")
    }
}
