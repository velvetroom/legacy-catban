import XCTest
@testable import Shared

class TestViewModel:XCTestCase {
    private var viewModel:ViewModel!
    private var property:MockViewModelPropertyProtocol!
    
    override func setUp() {
        super.setUp()
        self.viewModel = ViewModel()
        self.property = MockViewModelPropertyProtocol()
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
    
    func testNotifyObserver() {
        var notified:Bool = false
        var notifiedAfterCopy:Bool = false
        let firstName:String = "hello world"
        let secondName:String = "lorem ipsum"
        self.property.observing = { (viewModel:MockViewModelPropertyProtocol) in
            if notified == false {
                notified = true
                XCTAssertEqual(firstName, viewModel.name, "Invalid value")
            } else {
                notifiedAfterCopy = true
                XCTAssertEqual(secondName, viewModel.name, "Invalid value")
            }
        }
        
        self.property.name = firstName
        self.viewModel.update(property:self.property)
        
        self.property.name = secondName
        self.viewModel.update(property:self.property)
        
        XCTAssertTrue(notified, "Not notified")
        XCTAssertTrue(notifiedAfterCopy, "Not notified after copy")
    }
}
