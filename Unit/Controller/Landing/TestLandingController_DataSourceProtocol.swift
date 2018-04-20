import XCTest
@testable import catban

class TestLandingController_DataSourceProtocol:XCTestCase {
    private var controller:LandingController<Landing>!
    private var project:Project!
    private var collection:MockLandingViewCollection!
    private var navigation:MockNavigationController!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
        static let originIndex:Int = 1
        static let destinationIndex:Int = 0
        static let columnIndex:Int = 0
        static let origin:IndexPath = IndexPath(item:445, section:66454)
        static let destination:IndexPath = IndexPath(item:7231, section:8345)
    }
    
    override func setUp() {
        super.setUp()
        self.controller = LandingController<Landing>()
        self.project = Project.factoryFirstProject()
        self.controller.model.project = project
        self.collection = MockLandingViewCollection()
        self.navigation = MockNavigationController()
        self.controller.model.presenter.collection.dataSource.delegate = self.controller
        self.navigation.addChildViewController(self.controller)
    }
    
    func testLoad() {
        XCTAssertNotNil(self.controller, "Failed to load controller")
        XCTAssertNotNil(self.project, "Failed to load project")
        XCTAssertNotNil(self.controller.model.project, "Controller has no project assigned")
    }
    
    func testMoveItemInSameColumn() {
        let expectedTitle:String = self.titleAt(card:Constants.originIndex, in:Constants.columnIndex)
        self.validateOriginalStateBeforeItemInSameColumn()
        self.moveItemInSameColumn()
        
        let updatedTitle:String = self.titleAt(card:Constants.destinationIndex, in:Constants.columnIndex)
        XCTAssertEqual(expectedTitle, updatedTitle, "Failed to move items")
    }
    
    func testUpdateViewModelOnMoveItemInSameColumn() {
        let expectedTitle:String = self.titleAt(card:Constants.originIndex, in:Constants.columnIndex)
        XCTAssertTrue(self.controller.model.presenter.collection.dataSource.viewModel.sections.isEmpty)
        self.moveItemInSameColumn()
        
        let updatedTitle:String = self.viewModelTitleAt(item:Constants.destinationIndex, in:Constants.columnIndex)
        XCTAssertEqual(expectedTitle, updatedTitle, "Failed to update view model on move items")
    }
    
    func testModelReceivedReorder() {
        self.startExpectation()
        let controller:LandingController<MockLandingProtocol> = LandingController<MockLandingProtocol>()
        controller.model.onMoveCardFrom = { [weak self] (origin:IndexPath, destination:IndexPath) in
            XCTAssertEqual(origin, Constants.origin, "Incorrect origin")
            XCTAssertEqual(destination, Constants.destination, "Incorrect destination")
            self?.expect?.fulfill()
        }
        
        controller.moveItemFrom(origin:Constants.origin, to:Constants.destination)
        
        self.waitExpectation()
    }
    
    private func validateOriginalStateBeforeItemInSameColumn() {
        let initialTitle:String = self.titleAt(card:Constants.destinationIndex, in:Constants.columnIndex)
        let expectedTitle:String = self.titleAt(card:Constants.originIndex, in:Constants.columnIndex)
        XCTAssertNotEqual(initialTitle, expectedTitle, "Expected title should be different than initial")
    }
    
    private func moveItemInSameColumn() {
        let originIndex:IndexPath = IndexPath(item:Constants.originIndex, section:Constants.columnIndex)
        let destinationIndex:IndexPath = IndexPath(item:Constants.destinationIndex, section:Constants.columnIndex)
        self.controller.model.presenter.collection.dataSource.collectionView(
            self.collection, moveItemAt:originIndex, to:destinationIndex)
    }
    
    private func titleAt(card:Int, in column:Int) -> String {
        return self.project.columns[column].cards[card].title
    }
    
    private func viewModelTitleAt(item:Int, in section:Int) -> String {
        let countSections:Int = self.controller.model.presenter.collection.dataSource.viewModel.sections.count
        XCTAssertGreaterThan(countSections, section, "View model not being updated")
        if countSections <= section {
            return String()
        }
        return self.controller.model.presenter.collection.dataSource.viewModel.sections[section].items[item].title
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Wait for expectation")
    }
    
    private func waitExpectation() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
