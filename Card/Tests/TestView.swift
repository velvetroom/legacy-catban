import XCTest
import Board
@testable import Card
@testable import Shared

class TestView:XCTestCase {
    private var view:Card.View!
    private var interactor:MockInteractor!
    private var card:CardProtocol!
    private var presenter:MockPresenter!
    private struct Constants {
        static let initialText:String = "hello world"
        static let updatedText:String = "lorem ipsum"
    }
    
    override func setUp() {
        super.setUp()
        Configuration.repositoryProjectType = MockRepositoryProjectProtocol.self
        self.view = Card.View()
        self.interactor = MockInteractor()
        self.presenter = MockPresenter()
        self.presenter.viewModel = self.view.presenter.viewModel
        self.view.presenter = self.presenter
        self.presenter.interactor = self.interactor
        self.card = CardFactory.newCard()
        self.interactor.card = self.card
        self.card.content = Constants.initialText
    }
    
    func testLoadingTrashImage() {
        let image:UIImage? = UIImage(name:ViewConstants.Navigation.iconDelete, in:View.self)
        XCTAssertNotNil(image)
    }
    
    func testSelectorDone() {
        var calledController:Bool = false
        self.interactor.onDone = { calledController = true }
        self.view.selectorDone(button:UIBarButtonItem())
        XCTAssertTrue(calledController, "Not called")
    }
    
    func testSelectorDelete() {
        var calledPresenter:Bool = false
        self.presenter.onDelete = { calledPresenter = true }
        self.view.selectorDelete(button:UIBarButtonItem())
        XCTAssertTrue(calledPresenter, "Not called")
    }
    
    func testUpdateCardContent() {
        XCTAssertNotNil(self.view.view, "Failed to load view")
        self.view.content.viewText.text = Constants.updatedText
        self.view.textViewDidChange(self.view.content.viewText)
        XCTAssertEqual(self.card.content, Constants.updatedText, "Failed to update card")
    }
}
