import XCTest
@testable import Home

class TestPresenterMenu:XCTestCase {/*
    private var presenter:PresenterMenu!
    private var controller:MockInteractor!
    private var view:View!
    
    override func setUp() {
        super.setUp()
        Configuration.canvasType = Canvas.self
        self.presenter = PresenterMenu()
        self.view = View()
        self.controller = MockInteractor()
        self.presenter.view = self.view
        self.presenter.controller = self.controller
    }
    
    func testNotRetainingController() {
        self.presenter.controller = Interactor()
        XCTAssertNil(self.presenter.controller, "Retains")
    }
    
    func testNotRetainingView() {
        self.presenter.view = View()
        XCTAssertNil(self.presenter.view, "Retains")
    }
    
    func testNotRetainingViewMenu() {
        self.presenter.viewMenu = ViewMenu()
        XCTAssertNil(self.presenter.viewMenu, "Retains")
    }
    
    func testInjectsItselfToView() {
        self.presenter.show()
        XCTAssertNotNil(self.presenter.viewMenu?.presenter, "Not injected")
    }
    
    func testOpenProjectsCallsController() {
        let expect:XCTestExpectation = expectation(description:"Waiting for call")
        self.controller.onOpenProjects = {
            expect.fulfill()
        }
        
        self.presenter.openProjects()
        waitForExpectations(timeout:1) { (error:Error?) in }
    }*/
}
