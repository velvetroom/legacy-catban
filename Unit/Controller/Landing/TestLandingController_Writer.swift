import XCTest
@testable import catban

class TestLandingController_Writer:XCTestCase {
    private var controller:LandingController!
    private var navigation:MockNavigationController!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let cardText:String = "lorem ipsum"
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.navigation = MockNavigationController()
        self.controller = LandingController()
        self.navigation.addChildViewController(self.controller)
    }
    
    func testLoad() {
        XCTAssertNotNil(self.controller, "Failed to load controller")
        XCTAssertNotNil(self.navigation, "Failed to load navigation controller")
    }
    
    func testWriterForCard() {
        self.startExpectation()
        let card:ProjectCard = self.factoryCard()
        self.navigation.onPresent = { [weak self] (controller:UIViewController) in
            guard
                let controller:WriterController = controller as? WriterController
            else {
                return
            }
            XCTAssertEqual(controller.model.text, card.title, "Failed to assign text model")
            self?.expect?.fulfill()
        }
        
        self.controller.openWriterFor(card:card)
        
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
