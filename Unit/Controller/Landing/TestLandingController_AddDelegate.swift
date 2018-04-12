import XCTest
@testable import catban

class TestLandingController_AddDelegate:XCTestCase {
    private var controller:LandingController!
    private var navigation:MockNavigationController!
    private var model:MockLandingProtocol!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.controller = LandingController()
        self.model = MockLandingProtocol()
        self.navigation = MockNavigationController()
        self.controller.model = self.model
        self.navigation.addChildViewController(self.controller)
    }
    
    func testLoad() {
        XCTAssertNotNil(self.controller, "Failed to load controller")
        XCTAssertNotNil(self.model, "Failed to load model")
    }
    
    func testCreateCard() {
        self.startExpectation()
        self.model.onCreateCard = { [weak self] in
            self?.expect?.fulfill()
        }
        
        self.controller.createCard()
        
        self.waitExpectations()
    }
    
    func testCreateCardShowsWriter() {
        self.startExpectation()
        self.controller.model = Landing()
        self.navigation.onPresent = { [weak self] (controller:UIViewController) in
            let writer:WriterController? = controller as? WriterController
            XCTAssertNotNil(writer, "Invalid controller presenter")
            self?.expect?.fulfill()
        }
        
        self.controller.createCard()
        
        self.waitExpectations()
    }
    
    func testCreateColumn() {
        self.startExpectation()
        self.model.onCreateColumn = { [weak self] in
            self?.expect?.fulfill()
        }
        
        self.controller.createColumn()
        
        self.waitExpectations()
    }
    
    func testCreateColumnShowsWriter() {
        self.startExpectation()
        self.controller.model = Landing()
        self.navigation.onPresent = { [weak self] (controller:UIViewController) in
            let writer:WriterController? = controller as? WriterController
            XCTAssertNotNil(writer, "Invalid controller presenter")
            self?.expect?.fulfill()
        }
        
        self.controller.createColumn()
        
        self.waitExpectations()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectations() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
