import XCTest
import Shared
import Canvas
import Board
@testable import Home

class TestInteractor_Namer:XCTestCase {
    private var view:Home.View!
    private var transition:MockTransitionProtocol!
    private var project:MockProjectManagedProtocol!
    private var presenter:MockPresenter!
    
    override func setUp() {
        super.setUp()
        Configuration.canvasType = Canvas.self
        Configuration.repositoryProjectType = MockRepositoryProjectProtocol.self
        self.view = Home.View()
        self.project = MockProjectManagedProtocol()
        self.transition = MockTransitionProtocol()
        self.presenter = MockPresenter()
        self.view.presenter.interactor.presenter = self.presenter
        self.view.presenter.interactor.project = self.project
        self.view.transition = self.transition
    }
    
    func testNamerFinishedUpdatesProject() {
        var updated = false
        self.presenter.onShouldUpdate = { updated = true }
        self.view.presenter.interactor.namerFinishedWith(name:String())
        XCTAssertTrue(updated, "Not updated")
    }
    
    func testNamerFinishedSavesProject() {
        var called:Bool = false
        MockRepositoryProjectProtocol.onSave = { called = true }
        self.view.presenter.interactor.namerFinishedWith(name:String())
        XCTAssertTrue(called, "Failed to save")
    }
    
    func testNamerFinishedAddsColumns() {
        let name:String = "hello world"
        self.view.presenter.interactor.namerFinishedWith(name:name)
        XCTAssertEqual(self.project.countColumns, 1, "Column not added")
        XCTAssertEqual(self.project.lastColumn?.name, name, "Name not set in column")
    }
    
    func testNamerCancelledUpdatesProject() {
        var updated = false
        self.presenter.onShouldUpdate = { updated = true }
        self.view.presenter.interactor.namerCancelled()
        XCTAssertTrue(updated, "Not updated")
    }
}
