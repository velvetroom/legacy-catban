import XCTest
@testable import Card
@testable import Board

class TestViewModelBuilder:XCTestCase {
    private var builder:ViewModelBuilder!
    private var card:CardProtocol!
    private var column:ColumnProtocol!
    private var viewModel:ViewModel!
    private struct Constants {
        static let cardContent:String = "lorem ipsum"
        static let columnName:String = "hello world"
    }
    
    override func setUp() {
        super.setUp()
        self.builder = ViewModelBuilder()
        self.card = CardFactory.newCard()
        self.column = ColumnFactory.newColumn()
        self.card.container = self.column
        self.builder.card = self.card
        self.card.content = Constants.cardContent
        self.column.name = Constants.columnName
        self.viewModel = self.builder.buildViewModel()
    }
    
    func testCardNotRetained() {
        self.card = nil
        XCTAssertNil(self.builder.card, "Retaining card")
    }
    
    func testBuildViewTitle() {
        XCTAssertEqual(self.viewModel.view.title, Constants.columnName, "Title not built")
    }
    
    func testBuildTextContent() {
        XCTAssertEqual(self.viewModel.text.content, Constants.cardContent, "Content not built")
    }
}
