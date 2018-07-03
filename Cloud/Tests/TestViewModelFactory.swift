import XCTest
import Board
import Architecture
@testable import Cloud

class TestViewModelFactory:XCTestCase {
    func testMakeContentWithNotClouded() {
        let project:ProjectProtocol = ProjectFactory.newProject()
        let viewModel:ViewModelContent = ViewModelFactory.makeContentWith(project:project)
        XCTAssertFalse(viewModel.buttonStartHidden, "Button should not be hidden")
    }
    
    func testNavigationWithNoClouded() {
        let project:ProjectProtocol = ProjectFactory.newProject()
        let viewModel:ViewModelNavigation = ViewModelFactory.makeNavigationWith(project:project)
        XCTAssertTrue(viewModel.toolbarHidden, "Tool bar should be hidden")
    }
    
    func testMakeContentWithError() {
        let viewModel:ViewModelContent = ViewModelFactory.makeContentWith(
            error:NSError(domain:String(), code:0, userInfo:nil))
        XCTAssertFalse(viewModel.buttonContinueHidden, "Button should not be hidden")
    }
    
    func testMakeContentCloud() {
        let project:ProjectProtocol = ProjectFactory.newProject()
        var synchable:ProjectSynchedProtocol = ProjectFactory.makeSynchable(project:project)
        synchable.changeTimestamp = 10
        let viewModel:ViewModelContent = ViewModelFactory.makeContentWith(project:synchable)
        XCTAssertTrue(viewModel.buttonStartHidden, "Button should be hidden")
    }
    
    func testNavigationWithClouded() {
        let project:ProjectProtocol = ProjectFactory.newProject()
        let synchable:ProjectSynchedProtocol = ProjectFactory.makeSynchable(project:project)
        let viewModel:ViewModelNavigation = ViewModelFactory.makeNavigationWith(project:synchable)
        XCTAssertFalse(viewModel.toolbarHidden, "Tool bar should not be hidden")
    }
    
    func testNavigationWithError() {
        let viewModel:ViewModelNavigation = ViewModelFactory.makeNavigationWith(
            error:NSError(domain:String(), code:0, userInfo:nil))
        XCTAssertTrue(viewModel.toolbarHidden, "Tool bar should be hidden")
    }
}
