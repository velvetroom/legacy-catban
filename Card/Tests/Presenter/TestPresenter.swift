import XCTest
@testable import Card
@testable import Shared

class TestPresenter:XCTestCase {
    private var presenter:Presenter!
    private var delegate:MockControllerProtocol!
    private var view:Shared.View!
    
    override func setUp() {
        super.setUp()
        self.presenter = Presenter()
        self.delegate = MockControllerProtocol()
        self.view = Shared.View()
        self.presenter.delegate = self.delegate
    }
    
    func testDelegateIsNotRetained() {
        self.presenter.delegate = Controller()
        XCTAssertNil(self.presenter.delegate, "Strong retained delegate")
    }
    
    func testControllerIsNotRetained() {
        self.presenter.controller = Controller()
        XCTAssertNil(self.presenter.controller, "Strong retained controller")
    }
    
    func testViewType() {
        let view:Card.View? = self.presenter.view as? Card.View
        XCTAssertNotNil(view, "Invalid view received")
    }
    
    func testLoadViewCallsDelegate() {
        var delegateCalled:Bool = false
        self.delegate.onDidLoadPresenter = {
            delegateCalled = true
        }
        
        self.presenter.didLoad(view:self.view)
        XCTAssertTrue(delegateCalled, "Failed to call delegate")
    }
    
    func testLoadOutlets() {
        self.presenter.didLoad(view:self.view)
        XCTAssertNotNil(self.presenter.outlets.viewText, "Not loaded")
    }
}
