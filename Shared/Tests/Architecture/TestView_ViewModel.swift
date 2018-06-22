import XCTest
@testable import Shared

class TestView_ViewModel:XCTestCase {
    func testInjectsViewModelWithPresenter() {
        let presenter:MockPresenterProtocol = PresenterFactory.makePresenter()
        let view:MockView = MockView(presenter:presenter)
        XCTAssertNotNil(view.presenter.viewModel, "Not injected")
    }
    
    func testInjectsViewModelWithoutPresenter() {
        let view:MockView = MockView()
        XCTAssertNotNil(view.presenter.viewModel, "Not injected")
    }
    
    func testUpdateNavigationOnViewWillAppear() {
        var updated:Bool = false
        let view:MockView = MockView()
        var viewModel:ViewModelNavigation = ViewModelNavigation()
        viewModel.observing = { (property:ViewModelNavigation) in
            updated = true
        }
        view.viewModel.update(property:viewModel)
        updated = false
        view.viewWillAppear(false)
        XCTAssertTrue(updated, "Failed to update")
    }
}
