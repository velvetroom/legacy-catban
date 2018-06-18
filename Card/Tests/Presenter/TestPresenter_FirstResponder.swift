import XCTest
import Board
@testable import Shared
@testable import Card

class TestPresenter_FirstResponder:XCTestCase {
    private var presenter:Presenter!
    private var delegate:MockControllerProtocol!
    private var controller:Interactor!
    private var text:MockViewText!
    private var view:Shared.View!
    private var project:ProjectManagedProtocol!
    private var transition:MockTransitionProtocol!
    
    override func setUp() {
        super.setUp()
        self.presenter = Presenter()
        self.delegate = MockControllerProtocol()
        self.controller = Interactor()
        self.text = MockViewText()
        self.transition = MockTransitionProtocol()
        self.view = Shared.View()
        self.presenter.controller = self.controller
        self.presenter.delegate = self.delegate
        self.presenter.outlets.view = self.view
        self.presenter.outlets.viewText = self.text
        let board:BoardProtocol = BoardFactory.newBoard()
        let project:ProjectProtocol = ProjectFactory.newProject()
        let managed:ProjectManagedProtocol = board.manage(project:project)
        self.project = managed
        self.controller.project = self.project
        self.controller.transiton = self.transition
    }
    
    func testTextBecomesFirstResponder() {
        var firstResponder:Bool = false
        self.text.onBecomeFirstResponder = {
            firstResponder = true
        }
        
        self.presenter.didAppear(view:self.view)
        XCTAssertTrue(firstResponder, "Not first responder")
    }
    
    func testTextResignsFirstResponderOnDone() {
        var resigns:Bool = false
        self.text.onResignsFirstResponder = {
            resigns = true
        }
        
        self.presenter.done()
        XCTAssertTrue(resigns, "Not resigning")
    }
    
    func testTextResignsFirstResponderOnDelete() {
        var resigns:Bool = false
        self.text.onResignsFirstResponder = {
            resigns = true
        }
        
        self.presenter.delete()
        XCTAssertTrue(resigns, "Not resigning")
    }
}
