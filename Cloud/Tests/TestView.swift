import XCTest
import Shared
import CleanArchitecture
@testable import Cloud

class TestView:XCTestCase {
    private var view:Cloud.View!
    private var presenter:MockPresenter!
    
    override func setUp() {
        super.setUp()
        Configuration.repositoryProjectType = MockRepositoryProjectProtocol.self
        self.view = Cloud.View()
        self.presenter = MockPresenter()
        self.presenter.viewModel = ViewModel()
        self.view.presenter = presenter
    }
    
    func testLoadImageNotClouded() {
        let image:UIImage = UIImage(name:Constants.Icon.assetNotClouded, in:Cloud.View.self)
        XCTAssertNotNil(image, "Failed to load")
    }
    
    func testLoadImageError() {
        let image:UIImage = UIImage(name:Constants.Icon.assetError, in:Cloud.View.self)
        XCTAssertNotNil(image, "Failed to load")
    }
    
    func testLoadImageClouded() {
        let image:UIImage = UIImage(name:Constants.Icon.assetCloud, in:Cloud.View.self)
        XCTAssertNotNil(image, "Failed to load")
    }
    
    func testLoadImageUpToDate() {
        let image:UIImage = UIImage(name:Constants.Icon.assetUpToDate, in:Cloud.View.self)
        XCTAssertNotNil(image, "Failed to load")
    }
    
    func testLoadImageAction() {
        let image:UIImage = UIImage(name:Constants.Action.asset, in:Cloud.View.self)
        XCTAssertNotNil(image, "Failed to load")
    }
    
    func testCallPresenterOnDone() {
        var called:Bool = false
        presenter.onDone = { called = true }
        self.view.selectorDone()
        XCTAssertTrue(called, "Not called")
    }
    
    func testCallPresenterOnContinue() {
        var called:Bool = false
        presenter.onUpdateViewModel = { called = true }
        self.view.selectorContinue()
        XCTAssertTrue(called, "Not called")
    }
    
    func testCallsPresenterOnStart() {
        var called:Bool = false
        presenter.onStart = { called = true }
        self.view.selectorStart()
        XCTAssertTrue(called, "Not called")
    }
    
    func testSetButtonDisabledOnStart() {
        self.view.selectorStart()
        XCTAssertFalse(self.view.content.buttonStart.isEnabled, "Should be disabled")
    }
    
    func testShouldBeEnabledOnRefresh() {
        self.view.didLoad()
        self.view.content.buttonStart.isEnabled = false
        let viewModel:ViewModelContent = self.view.viewModel.property()
        self.view.viewModel.update(property:viewModel)
        XCTAssertTrue(self.view.content.buttonStart.isEnabled, "Not enabled on refresh")
    }
    
    func testUpdatesViewModel() {
        self.view.didLoad()
        var viewModel:ViewModelContent = self.view.viewModel.property()
        viewModel.buttonContinueHidden = false
        self.view.viewModel.update(property:viewModel)
        XCTAssertFalse(self.view.content.buttonContinue.isHidden, "Should not be hidden")
    }
}
