import XCTest
import Shared
import Board
@testable import Card

class TestInteractor:XCTestCase {
    private var view:Card.View!
    private var interactor:Interactor!
    private var transition:MockTransitionProtocol!
    private var project:MockProjectManagedProtocol!
    private var card:CardProtocol!
    
    override func setUp() {
        super.setUp()
        Configuration.repositoryProjectType = MockRepositoryProjectProtocol.self
        self.view = Card.View()
        self.interactor = self.view.presenter.interactor
        self.card = CardFactory.newCard()
        self.transition = MockTransitionProtocol()
        self.project = MockProjectManagedProtocol()
        self.view.transition = self.transition
        self.interactor.project = self.project
        self.interactor.card = self.card
    }
    
    func testCardIsNotRetained() {
        self.interactor.card = CardFactory.newCard()
        XCTAssertNil(self.interactor.card, "Strong retained")
    }
    
    func testDoneTransitionsToHome() {
        var transitioned:Bool = false
        self.transition.onTransitionToHome = { transitioned = true }
        self.interactor.done()
        XCTAssertTrue(transitioned, "No transition")
    }
    
    func testDeleteTransitions() {
        var transitioned:Bool = false
        self.transition.onTransitionToHome = { transitioned = true }
        self.interactor.deleteConfirmed()
        XCTAssertTrue(transitioned, "No transition")
    }
    
    func testDeleteRemovesCard() {
        let column:ColumnProtocol = ColumnFactory.newColumn()
        column.add(card:self.card)
        self.project.add(column:column)
        self.interactor.deleteConfirmed()
        XCTAssertEqual(column.countCards, 0, "Not removed")
    }
    
    func testDeleteSavesProject() {
        var called:Bool = false
        let column:ColumnProtocol = ColumnFactory.newColumn()
        column.add(card:self.card)
        self.project.add(column:column)
        MockRepositoryProjectProtocol.onSave = { called = true }
        self.interactor.deleteConfirmed()
        XCTAssertTrue(called, "Failed to save")
    }
    
    func testDoneSavesProject() {
        var called:Bool = false
        MockRepositoryProjectProtocol.onSave = { called = true }
        self.interactor.done()
        XCTAssertTrue(called, "Failed to save")
    }
}
