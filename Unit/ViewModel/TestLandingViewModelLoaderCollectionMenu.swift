import XCTest
@testable import catban

class TestLandingViewModelLoaderCollectionMenu:XCTestCase {
    private var loader:LandingViewModelLoaderCollectionMenu!
    private var project:Project!
    
    override func setUp() {
        super.setUp()
        self.loader = LandingViewModelLoaderCollectionMenu()
        self.project = Project.factoryNewProject()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.loader, "Failed to load loader")
        XCTAssertNotNil(self.project, "Failed to load project")
    }
    
    func testFactory() {
        let index:IndexPath = IndexPath(item:0, section:0)
        let viewModel:LandingViewModelCollectionMenu = self.loader.factoryWith(project:self.project, editing:index)
        XCTAssertNotNil(viewModel, "Failed to factory view model")
    }
    
    func testShowsMenu() {
        let index:IndexPath = IndexPath(item:0, section:0)
        let viewModel:LandingViewModelCollectionMenu = self.loader.factoryWith(project:self.project, editing:index)
        XCTAssertEqual(viewModel.layoutBottom, 0, "Failed to show menu")
    }
    
    func testNoMovingCards() {
        let index:IndexPath = IndexPath(item:0, section:0)
        self.configureProjectWithOneCard()
        let viewModel:LandingViewModelCollectionMenu = self.loader.factoryWith(project:self.project, editing:index)
        XCTAssertFalse(viewModel.moveLeftEnabled, "Move left should be disbaled")
        XCTAssertFalse(viewModel.moveRightEnabled, "Move right should be disbaled")
    }
    
    func testMovingRightAllowed() {
        let index:IndexPath = IndexPath(item:0, section:0)
        let viewModel:LandingViewModelCollectionMenu = self.loader.factoryWith(project:self.project, editing:index)
        XCTAssertFalse(viewModel.moveLeftEnabled, "Move left should be disbaled")
        XCTAssertTrue(viewModel.moveRightEnabled, "Move right should be enabled")
    }
    
    func testMovingLeftAllowed() {
        let index:IndexPath = IndexPath(item:0, section:2)
        let viewModel:LandingViewModelCollectionMenu = self.loader.factoryWith(project:self.project, editing:index)
        XCTAssertTrue(viewModel.moveLeftEnabled, "Move left should be enabled")
        XCTAssertFalse(viewModel.moveRightEnabled, "Move right should be disabled")
    }
    
    func testAllMovingAllowed() {
        let index:IndexPath = IndexPath(item:0, section:1)
        let viewModel:LandingViewModelCollectionMenu = self.loader.factoryWith(project:self.project, editing:index)
        XCTAssertTrue(viewModel.moveLeftEnabled, "Move left should be enabled")
        XCTAssertTrue(viewModel.moveRightEnabled, "Move right should be enabled")
    }
    
    private func configureProjectWithOneCard() {
        let card:ProjectCard = ProjectCard()
        let column:ProjectColumn = ProjectColumn()
        column.cards.append(card)
        self.project = Project()
        self.project.columns.append(column)
    }
}
