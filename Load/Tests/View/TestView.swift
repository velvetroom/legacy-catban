import XCTest
@testable import Load
@testable import Shared

class TestView:XCTestCase {
    private var view:Load.View!
    private var delegate:MockPresenterProtocol!
    private var controller:MockControllerProtocol!
    
    override func setUp() {
        super.setUp()
        self.view = Load.View()
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
    
    func testImage() {
        let image:UIImage = UIImage(name:ViewConstants.assetLogo, in:View.self)
        XCTAssertNotNil(image)
    }
}
