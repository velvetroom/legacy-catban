import XCTest
@testable import Home

class TestPresenter_Canvas:XCTestCase {
    private var view:Home.View!
    private var project:MockProjectProtocol!
    private var canvas:MockCanvasProtocol!
    
    override func setUp() {
        super.setUp()
        self.view = Home.View()
        self.project = MockProjectProtocol()
        self.canvas = MockCanvasProtocol()
        self.view.presenter.interactor.project = self.project
        self.view.presenter.canvas = self.canvas
    }
    
    func testOrientationChangedRefreshCanvas() {
        var refreshed:Bool = false
        self.canvas.onRefresh = { refreshed = true }
        self.view.presenter.orientationChanged()
        XCTAssertTrue(refreshed, "Not refreshed")
    }
    
    func testShouldUpdateRefreshCanvas() {
        var refreshed:Bool = false
        self.canvas.onRefresh = { refreshed = true }
        self.view.presenter.shouldUpdate()
        XCTAssertTrue(refreshed, "Not refreshed")
    }
    
    func testDidLoadConfiguresCanvas() {
        self.view.presenter.didLoad()
        XCTAssertNotNil(self.canvas.delegate, "Not injected")
        XCTAssertNotNil(self.canvas.project, "Not injected")
    }
    
    func testDidLoadRefreshCanvas() {
        var refreshed:Bool = false
        self.canvas.onRefresh = { refreshed = true }
        self.view.presenter.didLoad()
        XCTAssertTrue(refreshed, "Not refreshed")
    }
}
