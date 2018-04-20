import XCTest
@testable import catban

class TestLandingController_WriterEditColumn:XCTestCase {
    private var controller:LandingController<MockLandingProtocol>!
    private var navigation:MockNavigationController!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let name:String = "lorem ipsum"
        static let updatedName:String = "hello world"
        static let wait:TimeInterval = 0.3
        static let columnIndex:Int = 9342
    }
    
    override func setUp() {
        super.setUp()
        self.controller = LandingController<MockLandingProtocol>()
        self.navigation = MockNavigationController()
        self.navigation.addChildViewController(self.controller)
        self.controller.model.returnColumnAtIndex.name = Constants.name
    }
    
    func testLoad() {
        XCTAssertNotNil(self.controller, "Failed to load controller")
        XCTAssertNotNil(self.navigation, "Failed to load navigation")
    }
    
    func testOpenWriterRequestsColumnByIndex() {
        self.startExpectation()
        self.controller.model.onColumnAtIndex = { [weak self] (index:Int) in
            XCTAssertEqual(index, Constants.columnIndex, "Invalid index requested")
            self?.expect?.fulfill()
        }
        self.controller.openWriterForColumnAt(index:Constants.columnIndex)
        
        self.waitExpectations()
    }
    
    func testOpenWriterPresentsController() {
        self.startExpectation()
        self.navigation.onPresent = { [weak self] (controller:UIViewController) in
            self?.expect?.fulfill()
        }
        self.controller.openWriterForColumnAt(index:Constants.columnIndex)
        
        self.waitExpectations()
    }
    
    func testOpenWriterConfiguresText() {
        self.startExpectation()
        self.navigation.onPresent = { [weak self] (controller:UIViewController) in
            guard
                let controller:WriterController<Writer> = controller as? WriterController<Writer>
            else { return }
            XCTAssertEqual(controller.model.text, Constants.name, "Text not configured")
            self?.expect?.fulfill()
        }
        self.controller.openWriterForColumnAt(index:Constants.columnIndex)
        
        self.waitExpectations()
    }
    
    func testOpenWriterConfiguresOnFinish() {
        self.startExpectation()
        self.navigation.onPresent = { [weak self] (controller:UIViewController) in
            guard
                let controller:WriterController<Writer> = controller as? WriterController<Writer>
            else { return }
            XCTAssertNotNil(controller.model.onFinish, "Failed to configure on finish")
            self?.expect?.fulfill()
        }
        self.controller.openWriterForColumnAt(index:Constants.columnIndex)
        
        self.waitExpectations()
    }
    
    func testOnFinishUpdatesColumnName() {
        self.startExpectation()
        let column:ProjectColumn = self.controller.model.columnAt(index:Constants.columnIndex)
        self.navigation.onPresent = { [weak self] (controller:UIViewController) in
            guard
                let controller:WriterController<Writer> = controller as? WriterController<Writer>
            else { return }
            controller.model.onFinish?(Constants.updatedName)
            XCTAssertEqual(column.name, Constants.updatedName, "Failed to update name")
            self?.expect?.fulfill()
        }
        self.controller.openWriterForColumnAt(index:Constants.columnIndex)
        
        self.waitExpectations()
    }
    
    func testOnFinishUpdatesColumn() {
        self.startExpectation()
        self.navigation.onPresent = { (controller:UIViewController) in
            guard
                let controller:WriterController<Writer> = controller as? WriterController<Writer>
            else { return }
            controller.model.onFinish?(Constants.updatedName)
        }
        self.controller.model.onUpdateColumnAt = { [weak self] (index:Int) in
            XCTAssertEqual(index, Constants.columnIndex, "Invalid column index")
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
