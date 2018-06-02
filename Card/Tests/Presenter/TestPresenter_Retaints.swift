import XCTest
@testable import Card

class TestPresenter_Retains:XCTestCase {
    private var presenter:Presenter!
    private var delegate:MockControllerProtocol!
    private var controller:Controller!
    
    override func setUp() {
        super.setUp()
        self.presenter = Presenter()
        self.delegate = MockControllerProtocol()
        self.controller = Controller()
        self.presenter.controller = self.controller
        self.presenter.delegate = self.delegate
    }
    
    func testDelegateIsNotRetained() {
        self.delegate = nil
        XCTAssertNil(self.presenter.delegate, "Strong retained delegate")
    }
    
    func testControllerIsNotRetained() {
        self.controller = nil
        XCTAssertNil(self.presenter.controller, "Strong retained controller")
    }
}
