import XCTest
@testable import catban

class TestLandingController_DelegateProtocol:XCTestCase {
    private var controller:LandingController!
    private var layoutMenuBottom:NSLayoutConstraint!
    private var project:Project!
    private struct Constants {
        static let menuInitialBottom:CGFloat = 99
    }
    
    override func setUp() {
        super.setUp()
        self.controller = LandingController()
        self.layoutMenuBottom = NSLayoutConstraint()
        self.project = Project.factoryNewProject()
        self.controller.presenter.outlets.list.layoutCollectionMenuBottom = self.layoutMenuBottom
        self.controller.project = self.project
    }
    
    func testLoad() {
        XCTAssertNotNil(self.controller, "Failed to load controller")
        XCTAssertNotNil(self.layoutMenuBottom, "Failed to load layout constraint")
        XCTAssertNotNil(self.project, "Failed to load project")
    }
    
    func testUpdateViewModelAfterCellSelect() {
        self.layoutMenuBottom.constant = Constants.menuInitialBottom
        let index:IndexPath = IndexPath(item:0, section:0)
        
        self.controller.delegateSelectCellAt(index:index)
        
        XCTAssertNotEqual(self.layoutMenuBottom.constant, Constants.menuInitialBottom, "Failed to update view model")
    }
}
