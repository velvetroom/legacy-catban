import XCTest
@testable import catban

class TestLandingPresenterCollection:XCTestCase {
    private var presenter:LandingPresenterCollection!
    private var viewModel:LandingViewModelCollection!
    private var viewCollection:MockLandingViewCollection!
    
    override func setUp() {
        super.setUp()
        self.presenter = LandingPresenterCollection()
        self.viewModel = LandingViewModelCollection()
        self.viewCollection = MockLandingViewCollection()
        self.presenter.dataSource.viewModel = self.viewModel
    }
    
    func testLoad() {
        XCTAssertNotNil(self.presenter, "Failed to load delegate")
        XCTAssertNotNil(self.presenter.delegate, "Failed to load delegate")
        XCTAssertNotNil(self.presenter.dataSource, "Failed to load data source")
        XCTAssertNotNil(self.presenter.gesture, "Failed to load gesture")
        XCTAssertNotNil(self.presenter.dataSource.viewModel, "Failed to load view model")
    }
}
