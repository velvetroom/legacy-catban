import XCTest
@testable import catban

class TestLandingController_Writer:XCTestCase {
    private var controller:LandingController!
    private var navigation:MockNavigationController!
    private var viewModelLoader:MockLandingViewModelLoader!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let cardText:String = "lorem ipsum"
        static let cardUpdatedText:String = "hello world"
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.navigation = MockNavigationController()
        self.controller = LandingController()
        self.viewModelLoader = MockLandingViewModelLoader()
        self.controller.model.viewModelLoader = self.viewModelLoader
        self.navigation.addChildViewController(self.controller)
    }
    
    func testLoad() {
        XCTAssertNotNil(self.controller, "Failed to load controller")
        XCTAssertNotNil(self.navigation, "Failed to load navigation controller")
        XCTAssertNotNil(self.viewModelLoader, "Failed to load view model loader")
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
            XCTAssertEqual(controller.model.text, card.title, "Failed to assign text to model")
            XCTAssertNotNil(controller.model.onFinish, "Failed to assign on finish function")
            self?.expect?.fulfill()
        }
        
        self.controller.openWriterFor(card:card)
        
        self.waitExpectations()
    }
    
    func testWriterForCardFinishedUpdatesCard() {
        let card:ProjectCard = self.factoryCard()
        self.controller.model.project.columns[0].cards.insert(card, at:0)
        self.controller.model.editingCard = IndexPath(item:0, section:0)
        
        self.controller.writerForCardFinished(title:Constants.cardUpdatedText)
        
        XCTAssertEqual(card.title, Constants.cardUpdatedText, "Failed to update card")
    }
    
    func testWriterOnFinishedCardUpdatesViewModel() {
        self.startExpectation()
        self.controller.model.editingCard = IndexPath(item:0, section:0)
        self.viewModelLoader.onLoadCalled = { [weak self] in
            self?.expect?.fulfill()
        }
        
        self.controller.writerForCardFinished(title:Constants.cardUpdatedText)
        
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
