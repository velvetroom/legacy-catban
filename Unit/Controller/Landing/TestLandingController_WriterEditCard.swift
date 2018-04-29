import XCTest
@testable import catban

class TestLandingController_Writer:XCTestCase {
    private var controller:LandingController<MockLandingProtocol>!
    private var navigation:MockNavigationController!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let cardText:String = "lorem ipsum"
        static let cardUpdatedText:String = "hello world"
        static let indexPath:IndexPath = IndexPath(item:1, section:0)
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.navigation = MockNavigationController()
        self.controller = LandingController<MockLandingProtocol>()
        self.navigation.addChildViewController(self.controller)
        self.controller.model.editingCard = Constants.indexPath
    }
    
    func testLoad() {
        XCTAssertNotNil(self.controller, "Failed to load controller")
        XCTAssertNotNil(self.navigation, "Failed to load navigation controller")
    }
    
    func testWriterForCard() {
        self.startExpectation()
        let card:ProjectCard = self.factoryCard()
        self.controller.model.returnCardAtIndex = card
        self.navigation.onPresent = { [weak self] (controller:UIViewController) in
            guard
                let controller:WriterController<Writer> = controller as? WriterController<Writer>
            else { return }
            XCTAssertEqual(controller.model.text, card.title, "Failed to assign text to model")
            XCTAssertNotNil(controller.model.onFinish, "Failed to assign on finish function")
            self?.expect?.fulfill()
        }
        
        self.controller.openWriterForEditingCard()
        
        self.waitExpectations()
    }
    
    func testWriterForCardCallbackTitleUpdated() {
        self.startExpectation()
        let card:ProjectCard = self.factoryCard()
        self.controller.model.returnCardAtIndex = card
        self.navigation.onPresent = { [weak self] (controller:UIViewController) in
            guard
                let controller:WriterController<Writer> = controller as? WriterController<Writer>
            else { return }
            controller.model.onFinish?(Constants.cardUpdatedText)
            XCTAssertEqual(card.title, Constants.cardUpdatedText, "Failed to update card")
            self?.expect?.fulfill()
        }
        self.controller.openWriterForEditingCard()
        
        self.waitExpectations()
    }
    
    func testWriterForCardCallbackUpdatesCard() {
        self.startExpectation()
        let card:ProjectCard = self.factoryCard()
        self.controller.model.returnCardAtIndex = card
        self.navigation.onPresent = { (controller:UIViewController) in
            guard
                let controller:WriterController<Writer> = controller as? WriterController<Writer>
            else { return }
            controller.model.onFinish?(Constants.cardUpdatedText)
        }
        self.controller.model.onUpdateCardAt = { [weak self] (index:IndexPath) in
            XCTAssertEqual(Constants.indexPath, index, "Invalid index to update")
            self?.expect?.fulfill()
        }
        self.controller.openWriterForEditingCard()
        
        self.waitExpectations()
    }
    
    private func factoryCard() -> ProjectCard {
        let card:ProjectCard = ProjectCard()
        card.title = Constants.cardText
        return card
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectations() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
