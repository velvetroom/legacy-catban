import XCTest
@testable import catban

class TestLandingViewModelLoader:XCTestCase {
    private var project:Project!
    private var loader:LandingViewModelLoader!
    private struct Constants {
        static let columnTitle:String = "test column"
        static let cardTitle:String = "test card"
    }
    
    override func setUp() {
        super.setUp()
        self.project = Project.factoryNewProject()
        self.loader = LandingViewModelLoader()
        self.appendTestCard()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.loader, "Failed to load loader")
    }
    
    func testLoadViewModel() {
        let viewModel:LandingViewModel = self.loader.factoryViewModelWith(project:project)
        self.validate(viewModel:viewModel)
    }
    
    private func appendTestCard() {
        let column:ProjectColumn = ProjectColumn()
        let card:ProjectCard = ProjectCard()
        card.title = Constants.cardTitle
        column.cards.append(card)
        self.project.columns.append(column)
    }
    
    private func validate(viewModel:LandingViewModel) {
        self.validate(collection:viewModel.collection)
    }
    
    private func validate(collection:LandingViewModelCollection) {
        let sections:Int = collection.sections.count
        XCTAssertEqual(self.project.columns.count, sections, "Invalid number of sections")
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
}
