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
        self.view.presenter.interactor.project = self.project
    }
    
    func testSavesProject() {
        var called:Bool = false
        MockRepositoryProjectProtocol.onSave = { called = true }
        self.view.presenter.interactor.project = MockProjectManagedProtocol()
        self.view.presenter.interactor.saveProject()
        XCTAssertTrue(called, "Failed to save")
    }/*
    
    func testCreateCardTransitionsToCard() {
        var transitioned:Bool = false
        self.transition.onTransitionToCard = { (card:CardProtocol, project:ProjectManagedProtocol) in
            transitioned = true
        }
        
        self.controller.createNewCard()
        XCTAssertTrue(transitioned, "Failed to transition")
    }
    
    func testEditCardTransitionsToCard() {
        var transitioned:Bool = false
        self.transition.onTransitionToCard = { (card:CardProtocol, project:ProjectManagedProtocol) in
            transitioned = true
        }
        
        self.controller.editCardWith(identifier:Constants.identifier)
        XCTAssertTrue(transitioned, "Failed to transition")
    }
    
    func testCreateColumnTransitionsToColumn() {
        var transitioned:Bool = false
        self.transition.onTransitionToColumn = {
            transitioned = true
        }
        
        self.controller.createNewColumn()
        XCTAssertTrue(transitioned, "Failed to transition")
    }
    
    func testEditColumnTransitionsToColumn() {
        var transitioned:Bool = false
        var column:ColumnProtocol = ColumnFactory.newColumn()
        column.identifier = Constants.identifier
        self.project.add(column:column)
        self.transition.onTransitionToColumn = {
            transitioned = true
        }
        
        self.controller.editColumnWith(identifier:Constants.identifier)
        XCTAssertTrue(transitioned, "Failed to transition")
    }
    
    func testOpenProjectTransitions() {
        var transitioned:Bool = false
        var column:ColumnProtocol = ColumnFactory.newColumn()
        column.identifier = Constants.identifier
        self.project.add(column:column)
        self.transition.onTransitionToProjects = { (board:BoardProjectsProtocol) in
            XCTAssertEqual(board.countProjects, 1, "Failed to unmanage project before transition")
            transitioned = true
        }
        
        self.controller.openProjects()
        XCTAssertTrue(transitioned, "Failed to transition")
    }*/
}
