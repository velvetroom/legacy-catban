import XCTest
@testable import Home

class TestPresenter_ViewModel_Cards:XCTestCase {
    private var presenter:Presenter!
    private var controller:Controller!
    private var viewModel:ViewModel!
    private var viewBoard:ViewBoard!
    private var viewScroll:ViewScroll!
    private struct Constants {
        static let initialCards:Int = 2
        static let finalCards:Int = 1
        static let cardIdentifier:String = "hello world"
        static let cardContent:String = "lorem ipsum"
        static let layoutConstantLeft:CGFloat = 3
        static let layoutConstantTop:CGFloat = 4
        static let layoutConstantHeight:CGFloat = 5
        static let layoutConstantWidth:CGFloat = 2
    }
    
    override func setUp() {
        super.setUp()
        self.presenter = Presenter()
        self.viewModel = ViewModel()
        self.viewBoard = ViewBoard()
        self.viewScroll = ViewScroll()
        self.controller = Controller()
        self.presenter.outlets.viewBoard = self.viewBoard
        self.presenter.outlets.viewScroll = self.viewScroll
        self.presenter.controller = self.controller
    }
    
    func testReloadColumns() {
        self.updatePresenterWith(cards:Constants.initialCards)
        
        XCTAssertEqual(self.viewBoard.subviews.count, Constants.initialCards + 1, "Invalid amount of subviews")
        self.validateCards()
        
        self.updatePresenterWith(cards:Constants.finalCards)
        
        XCTAssertEqual(self.viewBoard.subviews.count, Constants.finalCards + 1, "Invalid amount of subviews")
        self.validateCards()
    }
    
    private func updatePresenterWith(cards:Int) {
        self.viewModel.columns = []
        var column:ViewModelColumn = ViewModelColumn()
        for _:Int in 0 ..< cards {
            var card:ViewModelCard = ViewModelCard()
            card.identifier = Constants.cardIdentifier
            card.content = Constants.cardContent
            card.height = Constants.layoutConstantHeight
            column.items.append(card)
        }
        self.viewModel.columns.append(column)
        self.presenter.updateWith(viewModel:self.viewModel)
    }
    
    private func validateCards() {
        for subView:UIView in self.viewBoard.subviews {
            guard
                let card:ViewCard = subView as? ViewCard
            else { break }
            XCTAssertNotNil(card.layoutLeft, "Failed to assign layout")
            XCTAssertNotNil(card.layoutTop, "Failed to assign layout")
            XCTAssertNotNil(card.layoutHeight, "Failed to assign layout")
            XCTAssertEqual(card.identifier, Constants.cardIdentifier, "Not assigned")
            XCTAssertEqual(card.superview, self.viewBoard, "Failed to assign superview")
            XCTAssertEqual(card.layoutLeft.constant, Constants.layoutConstantLeft, "Failed to assign constant")
            XCTAssertEqual(card.layoutTop.constant, Constants.layoutConstantTop, "Failed to assign constant")
            XCTAssertEqual(card.layoutHeight.constant, Constants.layoutConstantHeight, "Failed to assign constant")
            XCTAssertEqual(card.layoutWidth.constant, Constants.layoutConstantWidth, "Failed to assign constant")
            XCTAssertEqual(card.labelContent.text, Constants.cardContent, "Failed to assign content")
        }
    }
}
