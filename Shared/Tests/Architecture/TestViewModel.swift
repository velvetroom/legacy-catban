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
        self.property.observer = self.observer
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
    
    func testNotifyObserver() {
        var notified:Bool = false
        var notifiedAfterCopy:Bool = false
        
        let firstName:String = "hello world"
        self.property.name = firstName
        self.observer.onMutated = { (received:String) in
            notified = true
            XCTAssertEqual(firstName, received, "Invalid value")
        }
        self.viewModel.update(property:self.property)
        
        let secondName:String = "lorem ipsum"
        self.property.name = secondName
        self.observer.onMutated = { (received:String) in
            notifiedAfterCopy = true
            XCTAssertEqual(secondName, received, "Invalid value")
        }
        self.viewModel.update(property:self.property)
        
        XCTAssertTrue(notified, "Not notified")
        XCTAssertTrue(notifiedAfterCopy, "Not notified after copy")
    }
}
