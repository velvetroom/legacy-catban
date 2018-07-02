import XCTest
import Board
import Architecture
@testable import Cloud

class TestViewModelFactory:XCTestCase {
    func testMakeContentWithNotClouded() {
        let project:ProjectProtocol = ProjectFactory.newProject()
        let viewModel:ViewModelContent = ViewModelFactory.makeContentWith(project:project)
        XCTAssertTrue(viewModel.actionHidden, "Action should be hidden")
    }
    
    func testNavigationWithNoClouded() {
        let project:ProjectProtocol = ProjectFactory.newProject()
        let viewModel:ViewModelNavigation = ViewModelFactory.makeNavigationWith(project:project)
        XCTAssertTrue(viewModel.toolbarHidden, "Tool bar should be hidden")
    }
    
    func testMakeContentWithUpToDate() {
        let project:ProjectProtocol = ProjectFactory.newProject()
        let synchable:ProjectSynchedProtocol = ProjectFactory.makeSynchable(project:project)
        let viewModel:ViewModelContent = ViewModelFactory.makeContentWith(project:synchable)
        XCTAssertTrue(viewModel.actionHidden, "Action should be hidden")
    }
    
    func testMakeContentNeedsSynching() {
        let project:ProjectProtocol = ProjectFactory.newProject()
        var synchable:ProjectSynchedProtocol = ProjectFactory.makeSynchable(project:project)
        synchable.changeTimestamp = 10
        let viewModel:ViewModelContent = ViewModelFactory.makeContentWith(project:synchable)
        XCTAssertFalse(viewModel.actionHidden, "Action should not be hidden")
    }
    
    func testNavigationWithClouded() {
        let project:ProjectProtocol = ProjectFactory.newProject()
        let synchable:ProjectSynchedProtocol = ProjectFactory.makeSynchable(project:project)
        let viewModel:ViewModelNavigation = ViewModelFactory.makeNavigationWith(project:synchable)
        XCTAssertFalse(viewModel.toolbarHidden, "Tool bar should not be hidden")
    }
}
