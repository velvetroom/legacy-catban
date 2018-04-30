import XCTest
@testable import catban

class TestLandingViewModelLoaderCollectionMenu:XCTestCase {
    private var loader:LandingViewModelLoaderCollectionMenu!
    private var project:ProjectProtocol!
    private var model:LandingProtocol!
    
    override func setUp() {
        super.setUp()
        self.loader = LandingViewModelLoaderCollectionMenu()
        self.project = Project.factoryFirstProject()
        self.model = Landing()
        self.model.project = project
    }
    
    func testLoad() {
        XCTAssertNotNil(self.loader, "Failed to load loader")
        XCTAssertNotNil(self.project, "Failed to load project")
        XCTAssertNotNil(self.model, "Failed to load model")
    }
    
    func testFactory() {
        self.model.editingCard = IndexPath(item:0, section:0)
        let viewModel:LandingViewModelCollectionMenu = self.loader.factoryWith(model:self.model)
        XCTAssertNotNil(viewModel, "Failed to factory view model")
    }
    
    func testShowsMenu() {
        self.model.editingCard = IndexPath(item:0, section:0)
        let viewModel:LandingViewModelCollectionMenu = self.loader.factoryWith(model:self.model)
        XCTAssertEqual(viewModel.layoutBottom, 0, "Failed to show menu")
    }
    
    func testNoMovingCards() {
        self.model.editingCard = IndexPath(item:0, section:0)
        self.configureProjectWithOneCard()
        let viewModel:LandingViewModelCollectionMenu = self.loader.factoryWith(model:self.model)
        XCTAssertFalse(viewModel.moveLeftEnabled, "Move left should be disabled")
        XCTAssertFalse(viewModel.moveRightEnabled, "Move right should be disabled")
    }
    
    func testMovingRightAllowed() {
        self.model.editingCard = IndexPath(item:0, section:0)
        let viewModel:LandingViewModelCollectionMenu = self.loader.factoryWith(model:self.model)
        XCTAssertFalse(viewModel.moveLeftEnabled, "Move left should be disabled")
        XCTAssertTrue(viewModel.moveRightEnabled, "Move right should be enabled")
    }
    
    func testMovingLeftAllowed() {
        self.model.editingCard = IndexPath(item:0, section:2)
        let viewModel:LandingViewModelCollectionMenu = self.loader.factoryWith(model:self.model)
        XCTAssertTrue(viewModel.moveLeftEnabled, "Move left should be enabled")
        XCTAssertFalse(viewModel.moveRightEnabled, "Move right should be disabled")
    }
    
    func testAllMovingAllowed() {
        self.model.editingCard = IndexPath(item:0, section:1)
        let viewModel:LandingViewModelCollectionMenu = self.loader.factoryWith(model:self.model)
        XCTAssertTrue(viewModel.moveLeftEnabled, "Move left should be enabled")
        XCTAssertTrue(viewModel.moveRightEnabled, "Move right should be enabled")
    }
    
    private func configureProjectWithOneCard() {
        let card:ProjectCard = ProjectCard()
        let column:ProjectColumn = ProjectColumn()
        column.cards.append(card)
        self.model.project = Project()
        self.model.project.columns.append(column)
    }
}
