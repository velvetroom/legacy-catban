import XCTest
import CleanArchitecture
import Board
import Shared
@testable import Card

class TestView:XCTestCase {
    private var view:Card.View!
    private var interactor:MockInteractor!
    private var card:CardProtocol!
    private var column:ColumnProtocol!
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
        self.presenter.viewModel = ViewModel()
        self.presenter.viewModel = self.view.presenter.viewModel
        self.view.presenter = self.presenter
        self.presenter.interactor = self.interactor
        self.card = CardFactory.newCard()
        self.column = ColumnFactory.newColumn()
        self.card.container = self.column
        self.interactor.card = self.card
        self.card.content = Constants.initialText
    }
    
    func testLoadingTrashImage() {
        let image:UIImage? = UIImage(name:ViewConstants.Navigation.iconDelete, in:View.self)
        XCTAssertNotNil(image)
    }
    
    func testDidLoadInjectsViewToKeyboardAdjuster() {
        self.view.didLoad()
        XCTAssertNotNil(self.view.presenter.keyboardAdjuster.view, "Not injected")
    }
    
    func testDidLoadAssignsTextDelegate() {
        self.view.didLoad()
        XCTAssertNotNil(self.view.content.viewText.delegate, "Not assigned")
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
    
    func testUpdateViewModel() {
        XCTAssertNotNil(self.view.view, "Failed to load view")
        var viewModel:ViewModelContent = ViewModelContent()
        viewModel.title = "hello world"
        viewModel.text = "lorem ipsum"
        self.view.viewModel.update(property:viewModel)
        XCTAssertEqual(self.view.title, viewModel.title, "Not updated")
        XCTAssertEqual(self.view.content.viewText.text, viewModel.text, "Not updated")
    }
}
