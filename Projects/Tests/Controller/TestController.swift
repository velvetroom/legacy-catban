import XCTest
import Board
import Shared
@testable import Projects

class TestController:XCTestCase {
    private var controller:Controller!
    private var transition:MockTransitionProtocol!
    private var presenter:MockPresenter!
    private var board:MockBoardProjectsProtocol!
    
    override func setUp() {
        super.setUp()
        self.controller = Controller()
        self.transition = MockTransitionProtocol()
        self.presenter = MockPresenter()
        self.board = MockBoardProjectsProtocol()
        self.controller.presenter = self.presenter
        self.controller.transiton = self.transition
        self.controller.board = self.board
        self.board.project = ProjectFactory.newProject()
    }
    
    func testNotRetainingTransition() {
        self.controller.transiton = MockTransitionProtocol()
        XCTAssertNil(self.controller.transiton, "Retains")
    }
    
    func testRetainsBoard() {
        self.controller.board = MockBoardProjectsProtocol()
        XCTAssertNotNil(self.controller.board, "Not retaining")
    }
    
    func testOpenProject() {
        var transitioned:Bool = false
        self.transition.onTransitionToHome = {
            transitioned = true
        }
        
        self.controller.openProjectWith(identifier:String())
        XCTAssertTrue(transitioned, "Failed")
    }
    
    func testUpdateProjectReloadsPresenter() {
        var updated:Bool = false
        self.presenter.onShouldUpdate = {
            updated = true
        }
        
        self.controller.update(project:String(), with:String())
        XCTAssertTrue(updated, "Not updated")
    }
    
    func testDeleteRemovesProject() {
        var removed:Bool = false
        self.board.onRemoveProject = {
            removed = true
        }
        
        self.controller.deleteProjectWith(identifier:String())
        XCTAssertTrue(removed, "Not removed")
    }
    
    func testDeleteProjectReloadsPresenter() {
        var updated:Bool = false
        self.presenter.onShouldUpdate = {
            updated = true
        }
        
        self.controller.deleteProjectWith(identifier:String())
        XCTAssertTrue(updated, "Not updated")
    }
    
    func testDeleteCallsRepository() {
        var called:Bool = false
        Configuration.repositoryProjectType = MockRepositoryProjectProtocol.self
        MockRepositoryProjectProtocol.onDelete = {
            called = true
        }
        
        self.controller.deleteProjectWith(identifier:String())
        XCTAssertTrue(called, "Failed to delete")
    }
    
    func testUpdateSavesProject() {
        var called:Bool = false
        Configuration.repositoryProjectType = MockRepositoryProjectProtocol.self
        MockRepositoryProjectProtocol.onSave = {
            called = true
        }
        
        self.controller.update(project:String(), with:String())
        XCTAssertTrue(called, "Failed to save")
    }
    
    func testAddSavesProject() {
        var called:Bool = false
        Configuration.repositoryProjectType = MockRepositoryProjectProtocol.self
        MockRepositoryProjectProtocol.onSave = {
            called = true
        }
        
        let _:ProjectProtocol = self.controller.addProject()
        XCTAssertTrue(called, "Failed to save")
    }
}
