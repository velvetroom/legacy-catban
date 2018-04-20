import XCTest
@testable import catban

class TestLandingController_SelectorsEdit:XCTestCase {
    private var controller:LandingController<Landing>!
    private var navigation:MockNavigationController!
    private var project:Project!
    private var expect:XCTestExpectation?
    
    private var editingCard:ProjectCard {
        get {
            return self.project.columns[Constants.editingColumn].cards[Constants.editingCard]
        }
    }
    
    private var editingIndex:IndexPath {
        get {
            return IndexPath(item:Constants.editingCard, section:Constants.editingColumn)
        }
    }
    
    private struct Constants {
        static let wait:TimeInterval = 0.3
        static let editingColumn:Int = 0
        static let editingCard:Int = 1
    }
    
    override func setUp() {
        super.setUp()
        self.controller = LandingController<Landing>()
        self.navigation = MockNavigationController()
        self.project = Project.factoryFirstProject()
        self.navigation.addChildViewController(self.controller)
        self.controller.model.project = self.project
        self.controller.model.editingCard = self.editingIndex
    }
    
    func testLoad() {
        XCTAssertNotNil(self.controller, "Failed to load controller")
        XCTAssertNotNil(self.navigation, "Failed to load navigation")
        XCTAssertNotNil(self.project, "Failed to load project")
    }
    
    func testEditCard() {
        self.startExpectation()
        self.navigation.onPresent = { [weak self] (controller:UIViewController) in
            guard
                let controller:WriterController<Writer> = controller as? WriterController<Writer>
            else { return }
            XCTAssertEqual(controller.model.text, self?.editingCard.title, "Failed to present editing card")
            self?.expect?.fulfill()
        }
        
        self.controller.selectorEditCard(sender:UIButton())
        
        self.waitExpectations()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectations() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
