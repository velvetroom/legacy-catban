import XCTest
@testable import catban

class TestStatsItemCompletion:XCTestCase {
    private var model:StatsItemCompletion!
    private var project:Project!
    private struct Constants {
        static let minColumns:Int = 0
        static let maxColumns:Int = 33
        static let columnsFirstOrder:Int = 1
        static let columnsSecondOrder:Int = 2
        static let columnsThirdOrder:Int = 3
    }
    
    override func setUp() {
        super.setUp()
        self.model = StatsItemCompletion()
        self.project = Project()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.project, "Failed to load project")
    }
    
    func testViewModelType() {
        let viewModel:StatsViewModelCollectionItemProtocol? = self.model.factoryViewModelWith(
            project:self.project) as? StatsViewModelCollectionItemCompletionProtocol
        XCTAssertNotNil(viewModel, "Invalid view model type")
    }
    
    func testViewModelMinColumns() {
        self.configureProjectWith(columns:Constants.minColumns)
        let viewModel:StatsViewModelCollectionItemProtocol? = self.model.factoryViewModelWith(
            project:self.project) as? StatsViewModelCollectionItemCompletionFirstOrder
        XCTAssertNotNil(viewModel, "Invalid view model type")
    }
    
    func testViewModelMaxColumns() {
        self.configureProjectWith(columns:Constants.maxColumns)
        let viewModel:StatsViewModelCollectionItemProtocol? = self.model.factoryViewModelWith(
            project:self.project) as? StatsViewModelCollectionItemCompletionThirdOrder
        XCTAssertNotNil(viewModel, "Invalid view model type")
    }
    
    func testViewModelFirstOrder() {
        self.configureProjectWith(columns:Constants.columnsFirstOrder)
        let viewModel:StatsViewModelCollectionItemProtocol? = self.model.factoryViewModelWith(
            project:self.project) as? StatsViewModelCollectionItemCompletionFirstOrder
        XCTAssertNotNil(viewModel, "Invalid view model type")
    }
    
    func testViewModelSecondOrder() {
        self.configureProjectWith(columns:Constants.columnsSecondOrder)
        let viewModel:StatsViewModelCollectionItemProtocol? = self.model.factoryViewModelWith(
            project:self.project) as? StatsViewModelCollectionItemCompletionSecondOrder
        XCTAssertNotNil(viewModel, "Invalid view model type")
    }
    
    func testViewModelThirdOrder() {
        self.configureProjectWith(columns:Constants.columnsThirdOrder)
        let viewModel:StatsViewModelCollectionItemProtocol? = self.model.factoryViewModelWith(
            project:self.project) as? StatsViewModelCollectionItemCompletionThirdOrder
        XCTAssertNotNil(viewModel, "Invalid view model type")
    }
    
    private func configureProjectWith(columns:Int) {
        for _:Int in 0 ..<  columns {
            self.project.columns.append(ProjectColumn())
        }
    }
}
