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
    
    func testUpdateEditingCardAfterCellSelect() {
        let index:IndexPath = IndexPath(item:0, section:0)
        
        self.controller.delegateSelectCellAt(index:index)
        
        XCTAssertNotNil(self.controller.viewModelLoader.editingCard, "Failed to update editing card")
    }
    
    func testUpdateViewModelAfterCellSelect() {
        self.layoutMenuBottom.constant = Constants.menuInitialBottom
        let index:IndexPath = IndexPath(item:0, section:0)
        
        self.controller.delegateSelectCellAt(index:index)
        
        XCTAssertEqual(self.layoutMenuBottom.constant, 0, "Failed to update view model")
    }
    
    func testRemoveEditingCardWhenDeselectCell() {
        let index:IndexPath = IndexPath(item:0, section:0)
        self.controller.delegateSelectCellAt(index:index)
        
        self.controller.delegateClearSelection()
        
        XCTAssertNil(self.controller.viewModelLoader.editingCard, "Failed to remove editing card")
    }
    
    func testUpdateViewModelAfterCellDeselect() {
        let index:IndexPath = IndexPath(item:0, section:0)
        self.controller.delegateSelectCellAt(index:index)
        
        self.controller.delegateClearSelection()
        
        XCTAssertEqual(self.layoutMenuBottom.constant, LandingController.Constants.collectionMenuHeight,
                       "Failed to update view model")
    }
}
