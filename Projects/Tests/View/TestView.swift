import XCTest
import Board
@testable import Projects

class TestView:XCTestCase {
    private var view:View!
    private var viewRenamer:ViewRenamer!
    private var presenter:Presenter!
    private var controller:MockController!
    private var board:MockBoardProjectsProtocol!
    
    override func setUp() {
        super.setUp()
        self.view = View()
        self.presenter = Presenter()
        self.controller = MockController()
        self.board = MockBoardProjectsProtocol()
        self.viewRenamer = ViewRenamer()
        self.presenter.list.items = [ViewModelListItem()]
        self.view.presenter = self.presenter
        self.presenter.controller = self.controller
        self.controller.board = self.board
        self.presenter.renamer.view = self.viewRenamer
    }
    
    func testNotRetainingPresenter() {
        self.view.presenter = Presenter()
        XCTAssertNil(self.view.presenter, "Retains")
    }
    
    func testOpenProject() {
        var called:Bool = false
        self.controller.onOpenProject = {
            called = true
        }
        
        self.view.selectorOpen(button:UIBarButtonItem())
        XCTAssertTrue(called, "Failed")
    }
    
    func testInjectsRenamerDelegate() {
        XCTAssertNotNil(self.view.view, "Failed to load view")
        XCTAssertNotNil(self.view.viewBase.viewRenamer.viewInput.viewField.delegate, "Not injected")
    }
    
    func testAddingANewProject() {
        var added:Bool = false
        self.board.onAddProject = { (project:ProjectProtocol) in
            XCTAssertFalse(project.identifier.isEmpty, "No identifier")
            added = true
        }
        
        self.view.selectorAddProject(button:UIBarButtonItem())
        XCTAssertTrue(added, "Not added")
    }
    
    func testAddProjectUpdatesSelectedItem() {
        self.presenter.renamer.item.identifier = String()
        self.view.selectorAddProject(button:UIBarButtonItem())
        XCTAssertFalse(self.presenter.renamer.item.identifier.isEmpty, "Selected not updated")
    }
    
    func testIconButtonDelete() {
        let image:UIImage? = UIImage(name:ViewConstants.Toolbar.assetDelete, in:View.self)
        XCTAssertNotNil(image, "Failed to load image")
    }
    
    func testIconButtonRename() {
        let image:UIImage? = UIImage(name:ViewConstants.Toolbar.assetRename, in:View.self)
        XCTAssertNotNil(image, "Failed to load image")
    }
    
    func testIconButtonColumns() {
        let image:UIImage? = UIImage(name:ViewConstants.Toolbar.assetColumns, in:View.self)
        XCTAssertNotNil(image, "Failed to load image")
    }
}
