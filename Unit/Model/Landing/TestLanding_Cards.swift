import XCTest
@testable import catban

class TestLanding_Cards:XCTestCase {
    private var model:Landing!
    private var project:MockProjectProtocol!
    private var presenter:MockLandingPresenter!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
        static let reorderIndex:Int = 4
        static let reorderDestination:Int = 5
        static let reorderSection:Int = 6
    }
    
    override func setUp() {
        super.setUp()
        self.model = Landing()
        self.project = MockProjectProtocol()
        self.presenter = MockLandingPresenter()
        self.model.project = self.project
        self.model.presenter = self.presenter
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.project, "Failed to load project")
        XCTAssertNotNil(self.presenter, "Failed to load presenter")
    }
    
    func testReorderItemCallsMoveOnProject() {
        self.startExpectation()
        self.project.onMove = { [weak self] (index:Int, destination:Int, section:Int) in
            XCTAssertEqual(index, Constants.reorderIndex, "Invalid index")
            XCTAssertEqual(destination, Constants.reorderDestination, "Invalid destination")
            XCTAssertEqual(section, Constants.reorderSection, "Invalid section")
            self?.expect?.fulfill()
        }
        
        self.model.reorderItemFrom(index:Constants.reorderIndex, to:Constants.reorderDestination,
                                   in:Constants.reorderSection)
        
        self.waitExpectation()
    }
    
    func testReloadViewModelOnReorderItem() {
        self.startExpectation()
        self.presenter.onUpdateViewModel = { [weak self] in
            self?.expect?.fulfill()
        }
        
        self.model.reorderItemFrom(index:Constants.reorderIndex, to:Constants.reorderDestination,
                                   in:Constants.reorderSection)
        
        self.waitExpectation()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectation() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
