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
        let image:UIImage = UIImage(name:ViewConstants.NotCloudedIcon.asset, in:Cloud.View.self)
        XCTAssertNotNil(image, "Failed to load")
    }
    
    func testLoadImageAction() {
        let image:UIImage = UIImage(name:ViewConstants.Action.asset, in:Cloud.View.self)
        XCTAssertNotNil(image, "Failed to load")
    }
    
    func testUpdatesProjectTitle() {
        let projectName:String = "hello world"
        self.view.didLoad()
        var viewModel:ViewModelProject = self.view.viewModel.property()
        viewModel.projectName = projectName
        self.view.viewModel.update(property:viewModel)
        XCTAssertEqual(self.view.titleProject.title, projectName, "Not updated")
    }
    
    func testSelectorDoneCallsPresenter() {
        var called:Bool = false
        let presenter:MockPresenter = MockPresenter()
        presenter.onDone = { called = true }
        self.view.presenter = presenter
        self.view.selectorDone(button:UIBarButtonItem())
        XCTAssertTrue(called, "Failed to call")
    }
}
