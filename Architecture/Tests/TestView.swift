import XCTest
import CleanArchitecture
@testable import Architecture

class TestView:XCTestCase {
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
