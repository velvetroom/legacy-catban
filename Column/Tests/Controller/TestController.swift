import XCTest
import Board
import Shared
@testable import Column

class TestController:XCTestCase {
    private var controller:Controller!
    private var transition:MockTransitionProtocol!
    private var project:MockProjectManagedProtocol!
    private var column:ColumnProtocol!
    
    override func setUp() {
        super.setUp()
        Configuration.repositoryProjectType = MockRepositoryProjectProtocol.self
        self.controller = Controller()
        self.transition = MockTransitionProtocol()
        self.project = MockProjectManagedProtocol()
        self.column = ColumnFactory.newColumn()
        self.controller.transiton = self.transition
        self.controller.project = self.project
        self.controller.column = self.column
    }
    
    func testNotRetainingColumn() {
        self.controller.column = ColumnFactory.newColumn()
        XCTAssertNil(self.controller.column, "Retains")
    }
    
    func testNotRetainingTransition() {
        self.controller.transiton = MockTransitionProtocol()
        XCTAssertNil(self.controller.transiton, "Retains")
    }
    
    func testInjectsDelegate() {
        XCTAssertNotNil(self.controller.presenter.delegate, "Not injected")
    }
    
    func testInjectsController() {
        let presenter:Column.Presenter = self.controller.presenter as! Column.Presenter
        XCTAssertNotNil(presenter.controller, "Not injected")
    }
    
    func testDoneTransitionsToHome() {
        var transition:Bool = false
        self.transition.onTransitionToHome = {
            transition = true
        }
        
        self.controller.done()
        XCTAssertTrue(transition, "Not transitioned")
    }
    
    func testDeleteColumn() {
        var transition:Bool = false
        self.project.onRemoveColumn = {
            transition = true
        }
        
        self.controller.delete()
        XCTAssertTrue(transition, "Not deleted")
    }
    
    func testDeleteTransitionsToHome() {
        var transition:Bool = false
        self.transition.onTransitionToHome = {
            transition = true
        }
        
        self.controller.delete()
        XCTAssertTrue(transition, "Not transitioned")
    }
    
    func testDoneSavesProject() {
        var called:Bool = false
        MockRepositoryProjectProtocol.onSave = {
            called = true
        }
        
        self.controller.done()
        XCTAssertTrue(called, "Failed to save")
    }
    
    func testDeleteSavesProject() {
        var called:Bool = false
        MockRepositoryProjectProtocol.onSave = {
            called = true
        }
        
        self.controller.delete()
        XCTAssertTrue(called, "Failed to save")
    }
}
