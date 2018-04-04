import XCTest
@testable import catban

class TestLandingViewModelLoader:XCTestCase {
    private var model:Landing!
    private var loader:LandingViewModelLoader!
    private var project:Project!
    private struct Constants {
        static let columnTitle:String = "test column"
        static let cardTitle:String = "test card"
    }
    
    override func setUp() {
        super.setUp()
        self.model = Landing()
        self.loader = LandingViewModelLoader()
        self.project = Project.factoryNewProject()
        self.model.project = project
        self.appendTestCard()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.loader, "Failed to load loader")
        XCTAssertNotNil(self.loader.collection, "Failed to load collection loader")
        XCTAssertNotNil(self.loader.outlets, "Failed to load outlets")
        XCTAssertNotNil(self.model, "Failed to load model")
    }
    
    func testLoadViewModel() {
        let viewModel:LandingViewModel = self.loader.factoryWith(model:self.model)
        self.validate(viewModel:viewModel)
    }
    
    func testMoveMenuUpWithEditingCard() {
        self.model.editingCard = IndexPath(item:0, section:0)
        
        let viewModel:LandingViewModel = self.loader.factoryWith(model:self.model)
        
        XCTAssertEqual(viewModel.outlets.collectionMenu.layoutBottom, 0,
                       "Not showing menu after editing card selected")
    }
    
    func testMoveMenuDownWithNoEditingCard() {
        let viewModel:LandingViewModel = self.loader.factoryWith(model:self.model)
        
        XCTAssertEqual(viewModel.outlets.collectionMenu.layoutBottom,
                       LandingController.Constants.collectionMenuHeight,
                       "Not hiding menu when there is no editing card")
    }
    
    private func appendTestCard() {
        let column:ProjectColumn = ProjectColumn()
        let card:ProjectCard = ProjectCard()
        card.title = Constants.cardTitle
        column.cards.append(card)
        self.project.columns.append(column)
    }
    
    private func validate(viewModel:LandingViewModel) {
        self.validateOutlets(viewModel:viewModel)
        self.validate(collection:viewModel.collection)
        self.validate(layout:viewModel.outlets.collectionLayout)
    }
    
    private func validateOutlets(viewModel:LandingViewModel) {
        XCTAssertEqual(viewModel.outlets.title, self.model.project.name, "Title should be equal to project name")
        XCTAssertTrue(viewModel.outlets.logoHidden, "Logo should be hidden after view model update")
    }
    
    private func validate(collection:LandingViewModelCollection) {
        let sections:Int = collection.sections.count
        XCTAssertEqual(self.model.project.columns.count, sections, "Invalid number of sections")
        for index:Int in 0 ..< sections {
            let section:LandingViewModelCollectionSection = collection.sections[index]
            let column:ProjectColumn = self.project.columns[index]
            self.validate(section:section, with:column)
        }
    }
    
    private func validate(section:LandingViewModelCollectionSection, with column:ProjectColumn) {
        XCTAssertEqual(section.title, column.name, "Failed to assign section title")
        let items:Int = section.items.count
        XCTAssertEqual(column.cards.count, items, "Invalid number of cards")
        for index:Int in 0 ..< items {
            let item:LandingViewModelCollectionItem = section.items[index]
            let card:ProjectCard = column.cards[index]
            self.validate(item:item, with:card)
        }
    }
    
    private func validate(item:LandingViewModelCollectionItem, with card:ProjectCard) {
        XCTAssertEqual(item.title, card.title, "Failed to assign item title")
    }
    
    private func validate(layout:LandingViewModelCollectionLayout) {
        self.validateColumns(layout:layout)
    }
    
    private func validateColumns(layout:LandingViewModelCollectionLayout) {
        let columns:Int = self.project.columns.count
        XCTAssertEqual(columns, layout.headers.count, "Incorrect amount of columns created")
    }
}
