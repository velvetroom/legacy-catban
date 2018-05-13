import XCTest
@testable import Board
@testable import Home

class TestViewModelBuilder_NewCard:XCTestCase {
    private var builder:ViewModelBuilder!
    private var viewModel:ViewModel!
    private var project:MockProjectManagedProtocol!
    private var column:ColumnProtocol!
    
    override func setUp() {
        super.setUp()
        self.builder = ViewModelBuilder()
        self.project = MockProjectManagedProtocol()
        self.column = ColumnFactory.newColumn()
        self.project.add(column:self.column)
        self.builder.project = self.project
        self.viewModel = self.builder.buildViewModel()
    }
    
    func testHasNewCard() {
        var newCard:ViewModelNewCard?
        for item:ViewModelBoardItemProtocol in self.viewModel.items {
            if let itemNewCard:ViewModelNewCard = item as? ViewModelNewCard {
                newCard = itemNewCard
            }
        }
        XCTAssertNotNil(newCard, "View model has no new card")
    }
    
    func testOnlyOneNewCard() {
        var countNewCards:Int = 0
        for item:ViewModelBoardItemProtocol in self.viewModel.items {
            if let _:ViewModelNewCard = item as? ViewModelNewCard {
                countNewCards += 1
            }
        }
        XCTAssertEqual(countNewCards, 1, "Invalid amount of new cards")
    }
}
