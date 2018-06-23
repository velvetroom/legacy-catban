import XCTest
import Board
import Shared
@testable import Card

class TestPresenter:XCTestCase {
    private var presenter:Presenter!
    private var interactor:MockInteractor!
    private var transition:MockTransitionProtocol!
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
        self.presenter.viewModel = ViewModel()
        self.transition = MockTransitionProtocol()
        self.view.transition = self.transition
        self.presenter.interactor = self.interactor
        self.interactor.card = self.card
        self.card.container = self.column
        self.column.name = Constants.columnName
        self.card.content = Constants.cardContent
    }
    
    func testUpdateViewModel() {
        self.view.presenter.didLoad()
        let viewModel:ViewModelContent = self.view.viewModel.property()
        XCTAssertEqual(viewModel.text, Constants.cardContent, "Not updated")
        XCTAssertEqual(viewModel.title, Constants.columnName, "Not updated")
    }
    
    func testUpdateContentsUpdatesCard() {
        let content:String = "asd"
        self.view.presenter.update(content:content)
        XCTAssertEqual(self.card.content, content, "Failed to update")
    }
    
    func testDoneCallsInteractor() {
        var called:Bool = false
        self.interactor.onDone = { called = true }
        self.view.presenter.done()
        XCTAssertTrue(called, "Not called")
    }
    
    func testDeletePresents() {
        var called:Bool = false
        self.transition.onPresent = { called = true }
        self.view.presenter.delete()
        XCTAssertTrue(called, "Not called")
    }
}
