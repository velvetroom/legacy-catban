import XCTest
@testable import Home

class TestPresenter_Updaters:XCTestCase {
    private var presenter:Presenter!
    private var controller:Controller!
    private var outlets:PresenterOutlets!
    private var viewModel:ViewModel!
    private var viewBoard:ViewBoard!
    
    override func setUp() {
        super.setUp()
        self.presenter = Presenter()
        self.controller = Controller()
        self.outlets = PresenterOutlets()
        self.viewModel = ViewModel()
        self.viewBoard = ViewBoard()
        self.presenter.controller = self.controller
        self.presenter.outlets.viewBoard = self.viewBoard
        self.presenter.updaters.append(MockPresenterUpdaterProtocol.self)
    }
    
    func testUpdatesAll() {
        self.presenter.updateWith(viewModel:self.viewModel)
        XCTAssertNotNil(MockPresenterUpdaterProtocol.updated, "Not updated")
        XCTAssertNotNil(MockPresenterUpdaterProtocol.updated.viewModel, "Not injected")
        XCTAssertNotNil(MockPresenterUpdaterProtocol.updated.outlets, "Not injected")
        XCTAssertNotNil(MockPresenterUpdaterProtocol.updated.controller, "Not injected")
        XCTAssertNotNil(MockPresenterUpdaterProtocol.updated.drag, "Not injected")
    }
}
