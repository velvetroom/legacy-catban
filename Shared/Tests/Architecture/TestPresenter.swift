import XCTest
@testable import Shared

class TestPresenter:XCTestCase {
    private var presenter:PresenterProtocol!
    private var delegate:MockControllerProtocol!
    
    override func setUp() {
        super.setUp()
        self.presenter = MockPresenterProtocol()
        self.delegate = MockControllerProtocol()
        self.presenter.delegate = self.delegate
    }
    
    func testLoad() {
        XCTAssertNotNil(self.presenter, "Failed to load presenter")
        XCTAssertNotNil(self.presenter.view, "Failed to load view")
        XCTAssertNotNil(self.delegate, "Failed to load delegate")
    }
    
    func testViewDidLoad() {
        var delegateCalled:Bool = false
        self.delegate.onViewDidLoad = {
            delegateCalled = true
        }
        self.presenter.viewDidLoad()
        XCTAssertTrue(delegateCalled, "Delegate is not called")
    }
}
