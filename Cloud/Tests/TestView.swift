import XCTest
import Shared
@testable import Cloud

class TestView:XCTestCase {
    private var view:Cloud.View!
    
    override func setUp() {
        super.setUp()
        self.view = Cloud.View()
    }
    
    func testLoadImageNotClouded() {
        let image:UIImage = UIImage(name:ViewConstants.Icon.assetNotClouded, in:Cloud.View.self)
        XCTAssertNotNil(image, "Failed to load")
    }
    
    func testLoadImageClouded() {
        let image:UIImage = UIImage(name:ViewConstants.Icon.assetCloud, in:Cloud.View.self)
        XCTAssertNotNil(image, "Failed to load")
    }
    
    func testLoadImageUpToDate() {
        let image:UIImage = UIImage(name:ViewConstants.Icon.assetUpToDate, in:Cloud.View.self)
        XCTAssertNotNil(image, "Failed to load")
    }
    
    func testLoadImageAction() {
        let image:UIImage = UIImage(name:ViewConstants.Action.asset, in:Cloud.View.self)
        XCTAssertNotNil(image, "Failed to load")
    }
    
    func testCallPresenterOnDone() {
        var called:Bool = false
        let presenter:MockPresenter = MockPresenter()
        self.view.presenter = presenter
        presenter.onDone = { called = true }
        self.view.selectorDone(button:UIBarButtonItem())
        XCTAssertTrue(called, "Not called")
    }
    
    func testCallsPresenterOnStart() {
        var called:Bool = false
        let presenter:MockPresenter = MockPresenter()
        self.view.presenter = presenter
        presenter.onStart = { called = true }
        self.view.selectorStart(button:UIButton())
        XCTAssertTrue(called, "Not called")
    }
    
    func testSetButtonDisabledOnStart() {
        self.view.selectorStart(button:UIButton())
        XCTAssertFalse(self.view.content.button.isEnabled, "Should be disabled")
    }
    
    func testShouldEnabledOnRefresh() {
        self.view.didLoad()
        self.view.content.button.isEnabled = false
        let viewModel:ViewModelContent = self.view.viewModel.property()
        self.view.viewModel.update(property:viewModel)
        XCTAssertTrue(self.view.content.button.isEnabled, "Not enabled on refresh")
    }
}
