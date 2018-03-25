import XCTest
@testable import catban

class TestLandingViewModelLoader:XCTestCase {
    private var project:Project!
    private var loader:LandingViewModelLoader!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.project = Project.factoryNewProject()
        self.loader = LandingViewModelLoader()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.loader, "Failed to load loader")
    }
    
    func testLoadViewModel() {
        self.startExpectation()
        
        self.loader.load(project:project) { [weak self] (viewModel:LandingViewModel) in
            self?.expect?.fulfill()
        }
        
        self.waitExpectations()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Wait for expectation")
    }
    
    private func waitExpectations() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
