import XCTest
@testable import catban

class TestLanding:XCTestCase {
    private var model:Landing!
    private var project:MockProjectProtocol!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let expectedIndexPath:IndexPath = IndexPath(item:9342, section:94323)
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.model = Landing()
        self.project = MockProjectProtocol()
        self.model.editingCard = Constants.expectedIndexPath
        self.model.project = self.project
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.model.editingCard, "Editing cell property not found")
        XCTAssertNotNil(self.model.editingCardReference, "Card reference property not found")
        XCTAssertNotNil(self.model.project, "Failed to load project")
        XCTAssertNotNil(self.model.viewModelLoader, "Failed to load view model loader")
        XCTAssertNotNil(self.model.presenter, "Failed to load presenter")
    }
    
    func testEditingCardReference() {
        self.startExpectation()
        self.project.onCardAtIndex = { [weak self] (indexPath:IndexPath) in
            XCTAssertEqual(indexPath, Constants.expectedIndexPath, "Invalid index path")
            self?.expect?.fulfill()
        }
        
        let _:ProjectCard? = self.model.editingCardReference
        
        self.waitExpectation()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectation() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
