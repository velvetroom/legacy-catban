import XCTest
@testable import catban

class TestLandingController_AddDelegate:XCTestCase {
    private var controller:LandingController<MockLandingProtocol>!
    private var navigation:MockNavigationController!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.controller = LandingController<MockLandingProtocol>()
        self.navigation = MockNavigationController()
        self.navigation.addChildViewController(self.controller)
    }
    
    func testLoad() {
        XCTAssertNotNil(self.controller, "Failed to load controller")
        XCTAssertNotNil(self.navigation, "Failed to load navigation")
    }
    
    func testCreateCard() {
        self.startExpectation()
        self.controller.model.onCreateCard = { [weak self] in
            self?.expect?.fulfill()
        }
        
        self.controller.createCard()
        
        self.waitExpectations()
    }
    
    func testCreateCardShowsWriter() {
        self.startExpectation()
        let controller:LandingController<Landing> = LandingController<Landing>()
        controller.model.project.insert(column:ProjectColumn(), at:0)
        self.navigation.addChildViewController(controller)
        self.navigation.onPresent = { [weak self] (controller:UIViewController) in
            let writer:WriterController<Writer>? = controller as? WriterController<Writer>
            XCTAssertNotNil(writer, "Invalid controller presented")
            self?.expect?.fulfill()
        }
        
        controller.createCard()
        
        self.waitExpectations()
    }
    
    func testCreateColumn() {
        self.startExpectation()
        self.controller.model.onCreateColumn = { [weak self] in
            self?.expect?.fulfill()
        }
        
        self.controller.createColumn()
        
        self.waitExpectations()
    }
    
    func testCreateColumnScrollsToTopRight() {
        self.startExpectation()
        self.controller.model.onScrollToTopRightCorner = { [weak self] in
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
