import XCTest
import Shared
import Canvas
import Board
@testable import Home

class TestController:XCTestCase {
    private var controller:Controller!
    
    override func setUp() {
        super.setUp()
        Configuration.canvasType = Canvas.self
        Configuration.repositoryProjectType = MockRepositoryProjectProtocol.self
        self.controller = Controller()
    }
    
    func testPresenterAssignamentAfterLoad() {
        XCTAssertNotNil(self.controller.presenter.delegate, "Failed to assign delegate to presenter")
    }
    
    func testAssignControllerToPresenter() {
        let presenter:Presenter = self.controller.presenter as! Presenter
        XCTAssertNotNil(presenter.controller, "Failed to inject controller to presenter")
    }
    
    func testTransitionIsNotRetained() {
        self.controller.transiton = MockTransitionProtocol()
        XCTAssertNil(self.controller.transiton, "Strong retained")
    }
    
    func testSavesProject() {
        var called:Bool = false
        MockRepositoryProjectProtocol.onSave = {
            called = true
        }
        
        self.controller.project = MockProjectManagedProtocol()
        self.controller.saveProject()
        XCTAssertTrue(called, "Failed to save")
    }
}
