import XCTest
@testable import Cloud

class TestView:XCTestCase {
    private var view:Cloud.View!
    
    override func setUp() {
        super.setUp()
        self.view = Cloud.View()
    }
    
    func testUpdatesProjectTitle() {
        let projectName:String = "hello world"
        self.view.didLoad()
        var viewModel:ViewModelContent = self.view.viewModel.property()
        viewModel.projectName = projectName
        self.view.viewModel.update(property:viewModel)
        XCTAssertEqual(self.view.titleProject.title, projectName, "Not updated")
    }
}
