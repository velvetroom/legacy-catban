import XCTest
import Shared
@testable import Card
@testable import Board

class TestController:XCTestCase {
    private var controller:Interactor!
    private var transition:MockTransitionProtocol!
    private var project:MockProjectManagedProtocol!
    private var card:CardProtocol!
    
    override func setUp() {
        super.setUp()
        Configuration.repositoryProjectType = MockRepositoryProjectProtocol.self
        self.card = CardFactory.newCard()
        self.controller = Interactor()
        self.transition = MockTransitionProtocol()
        self.project = MockProjectManagedProtocol()
        self.controller.transiton = self.transition
        self.controller.project = self.project
        self.controller.card = self.card
    }
    
    func testPresenter() {
        XCTAssertNotNil(self.controller.presenter, "Failed to load")
        XCTAssertNotNil(self.controller.presenter.delegate, "Failed to assign")
    }
    
    func testControllerOnPresenter() {
        let presenter:Presenter = self.controller.presenter as! Presenter
        XCTAssertNotNil(presenter.controller, "Failed to assign")
    }
    
    func testCardIsNotRetained() {
        self.controller.card = CardFactory.newCard()
        XCTAssertNil(self.controller.card, "Strong retained")
    }
    
    func testTransitionIsNotRetained() {
        self.transition = nil
        XCTAssertNil(self.controller.transiton, "Strong retained")
    }
    
    func testDone() {
        var transitioned:Bool = false
        self.transition.onTransitionToHome = {
            transitioned = true
        }
        
        self.controller.done()
        XCTAssertTrue(transitioned, "No transition")
    }
    
    func testDeleteTransitions() {
        var transitioned:Bool = false
        self.transition.onTransitionToHome = {
            transitioned = true
        }
        
        self.controller.delete()
        XCTAssertTrue(transitioned, "No transition")
    }
    
    func testDeleteRemovesCard() {
        let column:ColumnProtocol = ColumnFactory.newColumn()
        column.add(card:self.card)
        self.project.add(column:column)
        self.controller.delete()
        XCTAssertEqual(column.countCards, 0, "Not removed")
    }
    
    func testDeleteSavesProject() {
        var called:Bool = false
        let column:ColumnProtocol = ColumnFactory.newColumn()
        column.add(card:self.card)
        self.project.add(column:column)
        MockRepositoryProjectProtocol.onSave = {
            called = true
        }
    
        self.controller.delete()
        XCTAssertTrue(called, "Failed to save")
    }
    
    func testDoneSavesProject() {
        var called:Bool = false
        MockRepositoryProjectProtocol.onSave = {
            called = true
        }
        
        self.controller.done()
        XCTAssertTrue(called, "Failed to save")
    }
}
