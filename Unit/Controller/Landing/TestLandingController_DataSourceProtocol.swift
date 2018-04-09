import XCTest
@testable import catban

class TestLandingController_DataSourceProtocol:XCTestCase {
    private var controller:LandingController!
    private var project:Project!
    private var collection:MockLandingViewCollection!
    private var mockModel:MockLandingProtocol!
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
        self.controller = LandingController()
        self.project = Project.factoryNewProject()
        self.controller.model.project = project
        self.collection = MockLandingViewCollection()
        self.mockModel = MockLandingProtocol()
        self.navigation = MockNavigationController()
        self.controller.model.presenter.collection.dataSource.delegate = self.controller
        self.navigation.addChildViewController(self.controller)
    }
    
    func testLoad() {
        XCTAssertNotNil(self.controller, "Failed to load controller")
        XCTAssertNotNil(self.project, "Failed to load project")
        XCTAssertNotNil(self.controller.model.project, "Controller has no project assigned")
        XCTAssertNotNil(self.mockModel, "Failed to load mock model")
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
        self.controller.model = self.mockModel
        self.mockModel.onMoveCardFrom = { [weak self] (origin:IndexPath, destination:IndexPath) in
            XCTAssertEqual(origin, Constants.origin, "Incorrect origin")
            XCTAssertEqual(destination, Constants.destination, "Incorrect destination")
            self?.expect?.fulfill()
        }
        
        self.controller.moveItemFrom(origin:Constants.origin, to:Constants.destination)
        
        self.waitExpectation()
    }
    
    func testDeleteItem() {
        self.startExpectation()
        self.controller.model = self.mockModel
        self.navigation.onPresent = { (controller:UIViewController) in
            guard
                let controller:LandingDeleteController = controller as? LandingDeleteController
            else {
                return
            }
            controller.model.onConfirm?()
        }
        self.mockModel.onDeleteCardAt = { [weak self] (index:IndexPath) in
            XCTAssertEqual(index, Constants.origin, "Invalid index for deletion")
            self?.expect?.fulfill()
        }
        
        self.controller.deleteItemAt(indexPath:Constants.origin)
        
        self.waitExpectation()
    }
    
    func testDeleteItemPresentsDeleteController() {
        self.startExpectation()
        self.navigation.onPresent = { [weak self] (controller:UIViewController) in
            guard
                let controller:LandingDeleteController = controller as? LandingDeleteController
            else {
                return
            }
            XCTAssertFalse(controller.model.itemName.isEmpty, "Failed to assign item name")
            XCTAssertNotNil(controller.model.onConfirm, "Failed to assign call back")
            self?.expect?.fulfill()
        }
        
        self.controller.deleteItemAt(indexPath:Constants.origin)
        
        self.waitExpectation()
    }
    
    func testEditHeaderAtClearsCardSelectiopn() {
        self.startExpectation()
        self.controller.model = self.mockModel
        self.mockModel.onClearCardSelection = { [weak self] in
            self?.expect?.fulfill()
        }
        
        self.controller.editHeaderAt(index:Constants.originIndex)
        
        self.waitExpectation()
    }
    
    func testEditHeaderAtPresentsEditController() {
        self.startExpectation()
        self.navigation.onPresent = { [weak self] (controller:UIViewController) in
            guard
                let controller:LandingColumnEditController = controller as? LandingColumnEditController
            else {
                return
            }
            XCTAssertNotNil(controller.model.onRename, "Failed to assign call back")
            XCTAssertNotNil(controller.model.onDelete, "Failed to assign call back")
            self?.expect?.fulfill()
        }
        
        self.controller.editHeaderAt(index:Constants.originIndex)
        
        self.waitExpectation()
    }
    
    func testEditHeaderAtOnRenameCallBack() {
        self.startExpectation()
        self.navigation.onPresent = { [weak self] (controller:UIViewController) in
            if let controller:LandingColumnEditController = controller as? LandingColumnEditController {
                controller.model.onRename?()
            } else if let _:WriterController = controller as? WriterController {
                self?.expect?.fulfill()
            }
        }
        
        self.controller.editHeaderAt(index:Constants.originIndex)
        
        self.waitExpectation()
    }
    
    func testEditHeaderAtOnDeleteCallBack() {
        self.startExpectation()
        self.navigation.onPresent = { [weak self] (controller:UIViewController) in
            if let controller:LandingColumnEditController = controller as? LandingColumnEditController {
                controller.model.onDelete?()
            } else if let _:LandingDeleteController = controller as? LandingDeleteController {
                self?.expect?.fulfill()
            }
        }
        
        self.controller.editHeaderAt(index:Constants.originIndex)
        
        self.waitExpectation()
    }
    
    func testDeleteSectionAt() {
        self.startExpectation()
        
        self.controller.deleteSectionAt(index:Constants.originIndex)
        
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
