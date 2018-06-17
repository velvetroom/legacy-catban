import XCTest
@testable import Shared

class TestViewModel:XCTestCase {
    private var viewModel:ViewModel!
    private var property:MockViewModelPropertyProtocol!
    private var observer:MockViewModelObserverProtocol!
    
    override func setUp() {
        super.setUp()
        self.viewModel = ViewModel()
        self.property = MockViewModelPropertyProtocol()
        self.observer = MockViewModelObserverProtocol()
    }
    
    func testContainsViewModelNavigation() {
        let navigation:ViewModelNavigation? = self.viewModel.property()
        XCTAssertNotNil(navigation, "Not conained")
    }
    
    func testUpdatesNavigation() {
        guard
            var navigation:ViewModelNavigation = self.viewModel.property()
        else { return }
        let current:Bool = navigation.toolbarHidden
        navigation.toolbarHidden = !current
        self.viewModel.update(property:navigation)
        let updatedNavigation:ViewModelNavigation? = self.viewModel.property()
        XCTAssertEqual(updatedNavigation?.toolbarHidden, !current, "Not updated")
    }
}
