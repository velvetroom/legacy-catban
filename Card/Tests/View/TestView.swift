import XCTest
import Board
@testable import Card
@testable import Shared

class TestView:XCTestCase {
    private var view:Card.View!
    private var controller:MockController!
    private var card:CardProtocol!
    private var presenter:MockPresenter!
    private var textView:UITextView!
    private struct Constants {
        static let initialText:String = "hello world"
        static let updatedText:String = "lorem ipsum"
    }
    
    override func setUp() {
        super.setUp()
        self.view = Card.View()
        self.controller = MockController()
        self.card = CardFactory.newCard()
        self.textView = UITextView()
        self.presenter = MockPresenter()
        self.presenter.controller = self.controller
        self.view.presenter = self.presenter
        self.controller.card = self.card
        self.card.content = Constants.initialText
        self.textView.text = Constants.updatedText
    }
    
    func testTrashImage() {
        let image:UIImage = UIImage(name:ViewConstants.Navigation.iconDelete, in:View.self)
        XCTAssertNotNil(image)
    }
    
    func testControllerNotRetained() {
        self.presenter = nil
        XCTAssertNil(self.view.presenter, "Strong retained")
    }
    
    func testSelectorDone() {
        var calledController:Bool = false
        self.controller.onDone = {
            calledController = true
        }
        
        self.view.selectorDone(button:UIBarButtonItem())
        XCTAssertTrue(calledController, "Not called")
    }
    
    func testSelectorDelete() {
        var calledPresenter:Bool = false
        self.presenter.onDelete = {
            calledPresenter = true
        }
        
        self.view.selectorDelete(button:UIBarButtonItem())
        XCTAssertTrue(calledPresenter, "Not called")
    }
    
    func testUpdateCardContent() {
        self.view.textViewDidChange(self.textView)
        XCTAssertEqual(self.card.content, Constants.updatedText, "Failed to update card")
    }
}
