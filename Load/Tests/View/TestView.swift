import XCTest
@testable import Load

class TestView:XCTestCase {
    private var view:View!
    private var delegate:MockPresenterProtocol!
    private var controller:MockControllerProtocol!
    
    override func setUp() {
        super.setUp()
        self.view = View()
        self.delegate = MockPresenterProtocol()
        self.controller = MockControllerProtocol()
        self.view.delegate = self.delegate
        self.delegate.delegate = self.controller
    }
    
    func testLoad() {
        XCTAssertNotNil(self.view, "Failed to load view")
        XCTAssertNotNil(self.delegate, "Failed to load delegate")
    }
    
    func testTitle() {
        XCTAssertNotNil(self.view.view, "Failed to load view in view")
        XCTAssertNotNil(self.view.title, "Failed to assign title")
        XCTAssertFalse(self.view.title!.isEmpty, "Title should not be empty")
    }
}
