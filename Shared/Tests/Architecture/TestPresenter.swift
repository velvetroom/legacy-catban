import XCTest
@testable import Shared

class TestPresenter:XCTestCase {
    private var presenter:MockPresenterProtocol!
    private var delegate:MockControllerProtocol!
    
    override func setUp() {
        super.setUp()
        self.presenter = MockPresenterProtocol()
        self.delegate = MockControllerProtocol()
        self.presenter.delegate = self.delegate
    }
    
    func testLoad() {
        XCTAssertNotNil(self.presenter, "Failed to load presenter")
        XCTAssertNotNil(self.presenter.viewType, "Failed to load view type")
        XCTAssertNotNil(self.delegate, "Failed to load delegate")
    }
    
    func testFactoryView() {
        let view:View? = self.presenter.view
        XCTAssertNotNil(view, "Failed to load view")
        XCTAssertNotNil(view?.delegate, "Failed to assign delegate")
    }
    
    func testViewDidLoad() {
        var delegateCalled:Bool = false
        self.delegate.onDidLoadPresenter = {
            delegateCalled = true
        }
        self.presenter.didLoad(view:UIView())
        XCTAssertTrue(delegateCalled, "Delegate is not called")
    }
}
