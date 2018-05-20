import XCTest
@testable import Canvas
@testable import Board

class TestPresenter:XCTestCase {
    private var presenter:Presenter!
    
    override func setUp() {
        super.setUp()
        self.presenter = Presenter()
    }
    
    func testNotRetainingProject() {
        self.presenter.project = MockProjectProtocol()
        XCTAssertNil(self.presenter.project, "Retains")
    }
    
    func testAssignsReferences() {
        XCTAssertNotNil(self.presenter.view.drag, "Not assigned")
        XCTAssertNotNil(self.presenter.model.mapDelegate, "Not assigned")
    }
    
    func testLoadAddsColumns() {
        let model:Model = Model()
        let mapDelegate:MockMapDelegateProtocol = MockMapDelegateProtocol()
        model.mapDelegate = mapDelegate
        let project:MockProjectProtocol = MockProjectProtocol()
        project.columns.append(MockColumnProtocol())
        self.presenter.project = project
        self.presenter.model = model
        self.presenter.refresh()
        XCTAssertFalse(model.columns.isEmpty, "Not loaded")
    }
}
