import XCTest
import Shared
@testable import Column

class TestView:XCTestCase {
    private var view:Column.View!
    private var presenter:MockPresenter!
    
    override func setUp() {
        super.setUp()
        self.view = Column.View()
        self.presenter = MockPresenter()
        self.presenter.viewModel = ViewModel()
        self.view.presenter = self.presenter
    }
    
    func testCallsPresenterOnDone() {
        var called:Bool = false
        self.presenter.onDone = { called = true }
        self.view.selectorDone(button:UIBarButtonItem())
        XCTAssertTrue(called, "Not called")
    }
    
    func testCallsPresenterOnDelete() {
        var called:Bool = false
        self.presenter.onDelete = { called = true }
        self.view.selectorDelete(button:UIBarButtonItem())
        XCTAssertTrue(called, "Not called")
    }
    
    func testCallsPresenterOnRename() {
        var called:Bool = false
        self.presenter.onRename = { called = true }
        self.view.selectorRename(button:UIBarButtonItem())
        XCTAssertTrue(called, "Not called")
    }
    
    func testLoadIconDelete() {
        let icon:UIImage? = UIImage(name:ViewConstants.Icons.delete, in:Column.View.self)
        XCTAssertNotNil(icon, "Failed to load")
    }
    
    func testLoadIconRename() {
        let icon:UIImage? = UIImage(name:ViewConstants.Icons.rename, in:Column.View.self)
        XCTAssertNotNil(icon, "Failed to load")
    }
    
    func testUpdateViewModel() {
        self.view.didLoad()
        var viewModel:ViewModelContent = ViewModelContent()
        viewModel.name = "hello world"
        self.view.viewModel.update(property:viewModel)
        XCTAssertEqual(self.view.content.labelName.text, viewModel.name, "Not updated")
    }
}
