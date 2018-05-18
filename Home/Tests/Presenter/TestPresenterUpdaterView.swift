import XCTest
@testable import Home

class TestPresenterUpdaterView:XCTestCase {
    private var presenter:PresenterUpdaterView!
    private var view:View!
    private struct Constants {
        static let title:String = "lorem ipsum"
    }
    
    override func setUp() {
        super.setUp()
        self.presenter = PresenterUpdaterView()
        self.view = View()
        self.presenter.outlets = PresenterOutlets()
        self.presenter.viewModel = ViewModel()
        self.presenter.outlets.view = self.view
        self.presenter.viewModel.view.title = Constants.title
    }
    
    func testUpdate() {
        XCTAssertNotEqual(self.view.title, Constants.title, "Should be empty or nil")
        self.presenter.update()
        XCTAssertEqual(self.view.title, Constants.title, "Not updated")
    }
    
    func testNotRetainingMap() {
        self.presenter.map = MockMapProtocol()
        XCTAssertNil(self.presenter.map, "Retains")
    }
}
