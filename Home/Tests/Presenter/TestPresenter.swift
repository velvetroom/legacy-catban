import XCTest
@testable import Shared
@testable import Home

class TestPresenter:XCTestCase {
    private var presenter:Presenter!
    private var delegate:MockControllerProtocol!
    
    override func setUp() {
        super.setUp()
        self.presenter = Presenter()
        self.delegate = MockControllerProtocol()
        self.presenter.delegate = self.delegate
    }
    
    func testLoad() {
        XCTAssertNotNil(self.presenter, "Failed to load presenter")
        XCTAssertNotNil(self.presenter.outlets, "Failed to load outlets")
        XCTAssertNotNil(self.presenter.view.delegate, "Failed to assign delegate")
        XCTAssertNotNil(self.delegate, "Failed to load delegate")
    }
    
    func testLoadView() {
        let view:Home.View? = self.presenter.view as? Home.View
        XCTAssertNotNil(view, "Invalid view received")
    }
    
    func testLoadViewCallsDelegate() {
        var delegateCalled:Bool = false
        self.delegate.onDidLoadPresenter = {
            delegateCalled = true
        }
        self.presenter.didLoad(view:UIView())
        
        XCTAssertTrue(delegateCalled, "Failed to call delegate")
    }
}
