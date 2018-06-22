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
        var navigation:ViewModelNavigation = self.viewModel.property()
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
    
    func testPropertyCreatesViewModelIfNotFound() {
        let property:MockViewModelPropertyProtocol? = self.viewModel.property()
        XCTAssertNotNil(property, "Failed to create property")
    }
    
    func testReturnsRightProperty() {
        self.viewModel.update(property:self.property)
        self.viewModel.update(property:ViewModelNavigation())
        let property:MockViewModelPropertyProtocol? = self.viewModel.property()
        XCTAssertNotNil(property, "Property is not the right type")
    }
    
    func testReplacesExistingPropertyOfSameType() {
        self.viewModel.update(property:ViewModelNavigation())
        self.viewModel.update(property:ViewModelNavigation())
        self.viewModel.update(property:ViewModelNavigation())
        self.viewModel.update(property:ViewModelNavigation())
        self.viewModel.update(property:ViewModelNavigation())
        XCTAssertEqual(self.viewModel.properties.count, 1, "Failed to replace")
    }
    
    func testCopyObserverWhenReplacingProperty() {
        var secondPropertyCalled:Bool = false
        var fourthPropertyCalled:Bool = false
        let firstProperty:MockViewModelPropertyProtocol = MockViewModelPropertyProtocol()
        self.viewModel.update(property:firstProperty)
        let returnAfterFirstProperty:MockViewModelPropertyProtocol = self.viewModel.property()
        XCTAssertNil(returnAfterFirstProperty.observing, "Should not contain observer")
        
        var secondProperty:MockViewModelPropertyProtocol = MockViewModelPropertyProtocol()
        secondProperty.observing = { (viewModel:MockViewModelPropertyProtocol) in
            secondPropertyCalled = true
        }
        self.viewModel.update(property:secondProperty)
        let returnAfterSecondProperty:MockViewModelPropertyProtocol = self.viewModel.property()
        XCTAssertNotNil(returnAfterSecondProperty.observing, "Should contain observer")
        
        let thirdProperty:MockViewModelPropertyProtocol = MockViewModelPropertyProtocol()
        self.viewModel.update(property:thirdProperty)
        let returnAfterThirdProperty:MockViewModelPropertyProtocol = self.viewModel.property()
        XCTAssertNotNil(returnAfterThirdProperty, "Should have copied observer")
        
        var fourthProperty:MockViewModelPropertyProtocol = MockViewModelPropertyProtocol()
        fourthProperty.observing = { (viewModel:MockViewModelPropertyProtocol) in
            fourthPropertyCalled = true
        }
        self.viewModel.update(property:fourthProperty)
        let returnAfterFourthProperty:MockViewModelPropertyProtocol = self.viewModel.property()
        XCTAssertNotNil(returnAfterFourthProperty, "Should have kept observer")
        
        secondPropertyCalled = false
        fourthPropertyCalled = false
        self.viewModel.update(property:MockViewModelPropertyProtocol())
        
        XCTAssertFalse(secondPropertyCalled, "Second should not be called")
        XCTAssertTrue(fourthPropertyCalled, "Fourth should not be called")
    }
}
