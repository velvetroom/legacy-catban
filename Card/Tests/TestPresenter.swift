import XCTest
import Board
import Shared
@testable import Card

class TestPresenter:XCTestCase {
    private var presenter:Presenter!
    private var interactor:MockInteractor!
    private var view:Card.View!
    private var card:CardProtocol!
    private var column:ColumnProtocol!
    private struct Constants {
        static let cardContent:String = "hello world"
        static let columnName:String = "lorem ipsum"
    }
    
    override func setUp() {
        super.setUp()
        Configuration.repositoryProjectType = MockRepositoryProjectProtocol.self
        self.view = Card.View()
        self.presenter = self.view.presenter
        self.interactor = MockInteractor()
        self.column = ColumnFactory.newColumn()
        self.card = CardFactory.newCard()
        self.card.container = self.column
        self.column.name = Constants.columnName
        self.card.content = Constants.cardContent
    }
    
    func testHooksReferences() {
        XCTAssertNotNil(self.view.view, "Failed to load view")
        XCTAssertNotNil(self.presenter.presenterForKeyboard.layoutBottom, "Not loaded")
        XCTAssertNotNil(self.presenter.presenterForKeyboard.viewContainer, "Not loaded")
        XCTAssertNotNil(self.view.content.viewText.delegate, "Not set")
    }
    
    func testUpdateViewModel() {
        XCTAssertNotNil(self.view.view, "Failed to load view")
        XCTAssertEqual(self.view.title, Constants.columnName, "Failed to update")
        XCTAssertEqual(self.view.content.viewText.text, Constants.cardContent, "Failed to update")
    }
}
