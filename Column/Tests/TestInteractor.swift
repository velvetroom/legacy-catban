import XCTest
import Board
import Shared
@testable import Column

class TestInteractor:XCTestCase {
    private var view:Column.View!
    private var interactor:Interactor!
    private var transition:MockTransitionProtocol!
    private var project:MockProjectManagedProtocol!
    private var column:ColumnProtocol!
    
    override func setUp() {
        super.setUp()
        Configuration.repositoryProjectType = MockRepositoryProjectProtocol.self
        self.view = Column.View()
        self.interactor = self.view.presenter.interactor
        self.transition = MockTransitionProtocol()
        self.project = MockProjectManagedProtocol()
        self.column = ColumnFactory.newColumn()
        self.view.transition = self.transition
        self.interactor.project = self.project
        self.interactor.column = self.column
    }
    
    func testDeleteColumnRemovesIt() {
        var removes:Bool = false
        self.project.onRemoveColumn = { removes = true }
        self.interactor.deleteConfirmed()
        XCTAssertTrue(removes, "Not deleted")
    }
    
    func testDeleteTransitionsToHome() {
        var transition:Bool = false
        self.transition.onTransitionToHome = { transition = true }
        self.interactor.deleteConfirmed()
        XCTAssertTrue(transition, "Not transitioned")
    }
    
    func testDeleteSavesProject() {
        var called:Bool = false
        MockRepositoryProjectProtocol.onSave = { called = true }
        self.interactor.deleteConfirmed()
        XCTAssertTrue(called, "Failed to save")
    }
    
    func testRenameSavesProject() {
        var called:Bool = false
        MockRepositoryProjectProtocol.onSave = { called = true }
        self.interactor.namerFinishedWith(name:String())
        XCTAssertTrue(called, "Failed to save")
    }
    
    func testRenameUpdatesColumn() {
        let name:String = "hello world"
        self.interactor.namerFinishedWith(name:name)
        XCTAssertEqual(self.column.name, name, "Not updated")
    }
}
