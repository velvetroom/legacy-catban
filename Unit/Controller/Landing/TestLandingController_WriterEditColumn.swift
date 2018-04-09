import XCTest
@testable import catban

class TestLandingController_WriterEditColumn:XCTestCase {
    private var controller:LandingController!
    private var navigation:MockNavigationController!
    private var model:MockLandingProtocol!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
        static let columnIndex:Int = 9342
    }
    
    override func setUp() {
        super.setUp()
        self.controller = LandingController()
        self.navigation = MockNavigationController()
        self.model = MockLandingProtocol()
        self.navigation.addChildViewController(self.controller)
        self.controller.model = self.model
    }
    
    func testLoad() {
        XCTAssertNotNil(self.controller, "Failed to load controller")
        XCTAssertNotNil(self.navigation, "Failed to load navigation")
        XCTAssertNotNil(self.model, "Failed to load model")
    }
    
    func testOpenWriterRequestsColumnByIndex() {
        self.startExpectation()
        self.model.onColumnAtIndex = { [weak self] (index:Int) in
            XCTAssertEqual(index, Constants.columnIndex, "Invalid index requested")
            self?.expect?.fulfill()
        }
        self.controller.openWriterForColumnAt(index:Constants.columnIndex)
        
        self.waitExpectations()
    }
    
    func testOpenWriterForColumnPresentsController() {
        self.startExpectation()
        self.navigation.onPresent = { [weak self] (controller:UIViewController) in
            guard
                let controller:WriterController = controller as? WriterController
            else {
                return
            }
            self?.expect?.fulfill()
        }
        self.controller.openWriterForColumnAt(index:Constants.columnIndex)
        
        self.waitExpectations()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectations() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
