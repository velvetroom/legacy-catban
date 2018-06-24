import XCTest
import Board
import Shared
@testable import Column

class TestPresenter:XCTestCase {
    private var view:Column.View!
    private var column:ColumnProtocol!
    private var interactor:MockInteractor!
    private var transition:MockTransitionProtocol!
    private var project:MockProject!
    
    override func setUp() {
        super.setUp()
        self.view = Column.View()
        self.column = ColumnFactory.newColumn()
        self.interactor = MockInteractor()
        self.transition = MockTransitionProtocol()
        self.project = MockProject()
        self.view.presenter.interactor = self.interactor
        self.interactor.column = self.column
        self.interactor.project = self.project
        self.view.transition = self.transition
    }
    
    func testDidLoadUpdatesViewModel() {
        self.column.name = "Hello world"
        self.view.presenter.didLoad()
        let viewModel:ViewModelContent = self.view.viewModel.property()
        XCTAssertEqual(viewModel.name, self.column.name, "Not updated")
    }
    
    func testShouldUpdateUpdatesViewModel() {
        self.column.name = "Hello world"
        self.view.presenter.shouldUpdate()
        let viewModel:ViewModelContent = self.view.viewModel.property()
        XCTAssertEqual(viewModel.name, self.column.name, "Not updated")
    }
    
    func testDoneTransitionsToHome() {
        var transitioned:Bool = false
        self.transition.onTransitionToHome = { transitioned = true }
        self.view.presenter.done()
        XCTAssertTrue(transitioned, "No transition")
    }
    
    func testRenamePushesView() {
        var pushed:Bool = false
        self.transition.onPush = { pushed = true }
        self.view.presenter.rename()
        XCTAssertTrue(pushed, "Not pushed")
    }
    
    func testDeletePresentesView() {
        var presented:Bool = false
        self.transition.onPresent = { presented = true }
        self.view.presenter.delete()
        XCTAssertTrue(presented, "Not presented")
    }
}
