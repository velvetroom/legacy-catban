import XCTest
import Shared
import Canvas
import Board
@testable import Home

class TestInteractor:XCTestCase {
    private var view:Home.View!
    private var transition:MockTransitionProtocol!
    private var project:MockProjectManagedProtocol!
    
    override func setUp() {
        super.setUp()
        Configuration.canvasType = Canvas.self
        Configuration.repositoryProjectType = MockRepositoryProjectProtocol.self
        self.view = Home.View()
        self.project = MockProjectManagedProtocol()
        self.transition = MockTransitionProtocol()
        self.view.presenter.interactor.project = self.project
        self.view.transition = self.transition
    }
    
    func testSavesProject() {
        var called:Bool = false
        MockRepositoryProjectProtocol.onSave = { called = true }
        self.view.presenter.interactor.project = MockProjectManagedProtocol()
        self.view.presenter.interactor.saveProject()
        XCTAssertTrue(called, "Failed to save")
    }
    
    func testCreateCardTransitionsToCard() {
        var transitioned:Bool = false
        self.transition.onTransitionToCard = { transitioned = true }
        self.view.presenter.interactor.createNewCard()
        XCTAssertTrue(transitioned, "Failed to transition")
    }
    
    func testCreateColumnTransitionsToColumn() {
        var transitioned:Bool = false
        self.transition.onPush = { transitioned = true }
        self.view.presenter.interactor.createNewColumn()
        XCTAssertTrue(transitioned, "Failed to transition")
    }
    
    func testEditColumnTransitionsToColumn() {
        var transitioned:Bool = false
        let identifier:String = "hello world"
        var column:ColumnProtocol = ColumnFactory.newColumn()
        column.identifier = identifier
        self.project.add(column:column)
        self.transition.onTransitionToColumn = { transitioned = true }
        self.view.presenter.interactor.editColumnWith(identifier:identifier)
        XCTAssertTrue(transitioned, "Failed to transition")
    }
    
    func testOpenProjectTransitions() {
        var transitioned:Bool = false
        self.transition.onTransitionToProjects = { transitioned = true }
        self.view.presenter.interactor.openProjects()
        XCTAssertTrue(transitioned, "Failed to transition")
    }
    
    func testCloseMenuUpdatesPresenter() {
        var called:Bool = false
        let presenter:MockPresenter = MockPresenter()
        self.view.presenter.interactor.presenter = presenter
        presenter.onShouldUpdate = { called = true }
        self.view.presenter.interactor.closedMenu()
        XCTAssertTrue(called, "Not updated")
    }
}
