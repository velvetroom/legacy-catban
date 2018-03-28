import XCTest
@testable import catban

class TestLandingController_DataSourceProtocol:XCTestCase {
    private var controller:LandingController!
    private var project:Project!
    private var collection:MockLandingViewCollection!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
        static let originIndex:Int = 1
        static let destinationIndex:Int = 0
        static let columnIndex:Int = 0
    }
    
    override func setUp() {
        super.setUp()
        self.controller = LandingController()
        self.project = Project.factoryNewProject()
        self.collection = MockLandingViewCollection()
        self.controller.project = self.project
    }
    
    func testLoad() {
        XCTAssertNotNil(self.controller, "Failed to load controller")
        XCTAssertNotNil(self.project, "Failed to load project")
        XCTAssertNotNil(self.controller.project, "Controller has no project assigned")
    }
    
    func testMoveItemInSameColumn() {
        let expectedTitle:String = self.titleAt(card:Constants.originIndex, in:Constants.columnIndex)
        self.validateOriginalStateBeforeItemInSameColumn()
        self.moveItemInSameColumn()
        
        let updatedTitle:String = self.titleAt(card:Constants.originIndex, in:Constants.columnIndex)
        XCTAssertEqual(expectedTitle, updatedTitle, "Failed to move items")
    }
    
    private func validateOriginalStateBeforeItemInSameColumn() {
        let initialTitle:String = self.titleAt(card:Constants.destinationIndex, in:Constants.columnIndex)
        let expectedTitle:String = self.titleAt(card:Constants.originIndex, in:Constants.columnIndex)
        XCTAssertNotEqual(initialTitle, expectedTitle, "Expected title should be different than initial")
    }
    
    private func moveItemInSameColumn() {
        let originIndex:IndexPath = IndexPath(item:Constants.originIndex, section:Constants.columnIndex)
        let destinationIndex:IndexPath = IndexPath(item:Constants.destinationIndex, section:Constants.columnIndex)
        self.controller.presenterCollection.dataSource.collectionView(
            self.collection, moveItemAt:originIndex, to:destinationIndex)
    }
    
    private func titleAt(card:Int, in column:Int) -> String {
        return self.project.columns[column].cards[card].title
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Wait for expectation")
    }
    
    private func waitExpectation() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
