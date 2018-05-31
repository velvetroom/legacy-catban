import XCTest
import Board
@testable import Projects

class TestPresenter_Renamer:XCTestCase {
    private var presenter:Presenter!
    private var view:View!
    private var viewRenamer:ViewRenamer!
    private var controller:Controller!
    private var board:MockBoardProjectsProtocol!
    private var project:ProjectProtocol!
    private var viewField:ViewRenamerField!
    private var viewList:ViewList!
    private struct Constants {
        static let originalName:String = "lorem ipsum"
        static let updatedName:String = "hello world"
    }
    
    override func setUp() {
        super.setUp()
        self.presenter = Presenter()
        self.viewRenamer = ViewRenamer()
        self.controller = Controller()
        self.board = MockBoardProjectsProtocol()
        self.project = ProjectFactory.newProject()
        self.view = View()
        self.viewList = ViewList()
        self.viewField = self.viewRenamer.viewInput.viewField
        self.presenter.list.selected.name = Constants.originalName
        self.board.project = self.project
        self.controller.board = self.board
        self.presenter.controller = self.controller
        self.controller.presenter = self.presenter
        self.presenter.outlets.list = self.viewList
        self.presenter.outlets.renamer = self.viewRenamer
        self.view.presenter = self.presenter
        self.viewField.delegate = self.view
        self.presenter.renamer.view = self.viewRenamer
        self.presenter.list.view = self.viewList
        self.presenter.renamer.item = ViewModelListItem()
    }
    
    func testRenameProjectShowsCurrentName() {
        self.presenter.renameProject()
        XCTAssertEqual(self.viewField.text, Constants.originalName, "Not showing")
    }
    
    func testRenamerInjectsViewModel() {
        self.presenter.renameProject()
        XCTAssertNotNil(self.presenter.renamer.item, "Failed to inject")
    }
    
    func testUpdateProjectSetsNewName() {
        self.viewField.text = Constants.updatedName
        self.viewField.delegate?.textFieldDidEndEditing?(self.viewField)
        XCTAssertEqual(self.project.name, Constants.updatedName, "Not updating")
    }
    
    func testAddProjectStartsEditingIt() {
        self.viewField.text = "lorem ipsum"
        self.presenter.addProject()
        XCTAssertEqual(self.viewField.text, String(), "Not editing")
    }
}
