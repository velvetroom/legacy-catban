import XCTest
import Shared
import Board
@testable import Home

class TestPresenter:XCTestCase {
    private var project:MockProjectManagedProtocol!
    private var view:Home.View!
    private var transition:MockTransitionProtocol!
    private var canvas:MockCanvasProtocol!
    
    override func setUp() {
        super.setUp()
        self.view = Home.View()
        self.project = MockProjectManagedProtocol()
        self.transition = MockTransitionProtocol()
        self.canvas = MockCanvasProtocol()
        self.view.presenter.canvas = self.canvas
        self.view.transition = self.transition
        self.view.presenter.interactor.project = self.project
    }
    
    func testShowMenuPresentsMenu() {
        var presented:Bool = false
        self.transition.onPresent = { presented = true }
        self.view.presenter.showMenu()
        XCTAssertTrue(presented, "Failed to present")
    }
    
    func testShowMenuUpdatesViewModel() {
        var viewModel:ViewModelMenu = ViewModelMenu()
        viewModel.show = true
        self.view.viewModel.update(property:viewModel)
        self.view.presenter.showMenu()
        let viewModelUpdated:ViewModelMenu = self.view.viewModel.property()
        XCTAssertFalse(viewModelUpdated.show, "Should hide menu")
    }
    
    func testShouldUpdateShowsMenu() {
        var viewModel:ViewModelMenu = ViewModelMenu()
        viewModel.show = false
        self.view.viewModel.update(property:viewModel)
        self.view.presenter.shouldUpdate()
        let viewModelUpdated:ViewModelMenu = self.view.viewModel.property()
        XCTAssertTrue(viewModelUpdated.show, "Should show menu")
    }
}
