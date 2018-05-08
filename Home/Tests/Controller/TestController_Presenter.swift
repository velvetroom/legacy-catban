import XCTest
@testable import Home
@testable import Board

class TestController_Presenter:XCTestCase {
    private var controller:Controller!
    private var presenter:MockPresenterProtocol!
    private var project:ProjectManagedProtocol!
    
    override func setUp() {
        super.setUp()
        self.controller = Controller()
        self.presenter = MockPresenterProtocol()
        self.controller.presenter = self.presenter
        let board:BoardProtocol = BoardFactory.newBoard()
        let project:ProjectProtocol = ProjectFactory.newProject()
        let managed:ProjectManagedProtocol = board.manage(project:project)
        self.project = managed
        self.controller.project = self.project
    }
    
    func testLoad() {
        XCTAssertNotNil(self.controller, "Failed to load controller")
        XCTAssertNotNil(self.presenter, "Failed to load presenter")
        XCTAssertNotNil(self.project, "Failed to load project")
    }
    
    func testOnLoadUpdatePresenter() {
        var presenterCalled:Bool = false
        self.presenter.onShouldUpdate = {
            presenterCalled = true
        }
        self.controller.didLoadPresenter()
        XCTAssertTrue(presenterCalled, "Presenter is called")
    }
}