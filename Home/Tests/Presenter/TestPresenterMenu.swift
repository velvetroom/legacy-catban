import XCTest
@testable import Home

class TestPresenterMenu:XCTestCase {
    private var view:ViewMenu!
    private var interactor:MockInteractor!
    private var transition:MockTransitionProtocol!
    
    override func setUp() {
        super.setUp()
        self.view = ViewMenu()
        self.interactor = MockInteractor()
        self.transition = MockTransitionProtocol()
        self.view.presenter.interactor = self.interactor
        self.view.transition = self.transition
    }
    
    func testNotRetainingInteractor() {
        self.view.presenter.interactor = Interactor()
        XCTAssertNil(self.view.presenter.interactor, "Retains")
    }
    
    func testCloseDismissesView() {
        let expect:XCTestExpectation = self.expectation(description:String())
        var dimissed:Bool = false
        self.transition.onDimiss = {
            dimissed = true
            expect.fulfill()
        }
        self.view.presenter.close()
        self.waitForExpectations(timeout:0.5) { (error:Error?) in
            XCTAssertTrue(dimissed, "Not dismissed")
        }
    }
    
    func testOpenProjectsDismissesView() {
        let expect:XCTestExpectation = self.expectation(description:String())
        var dimissed:Bool = false
        self.transition.onDimiss = {
            dimissed = true
            expect.fulfill()
        }
        self.view.presenter.openProjects()
        self.waitForExpectations(timeout:0.5) { (error:Error?) in
            XCTAssertTrue(dimissed, "Not dismissed")
        }
    }
    
    func testOpenAboutDismissesView() {
        let expect:XCTestExpectation = self.expectation(description:String())
        var dimissed:Bool = false
        self.transition.onDimiss = {
            dimissed = true
            expect.fulfill()
        }
        self.view.presenter.openAbout()
        self.waitForExpectations(timeout:0.5) { (error:Error?) in
            XCTAssertTrue(dimissed, "Not dismissed")
        }
    }
    
    func testCloseNotifiesInteractor() {
        let expect:XCTestExpectation = self.expectation(description:String())
        var called:Bool = false
        self.interactor.onClosedMenu = {
            called = true
            expect.fulfill()
        }
        self.view.presenter.close()
        self.waitForExpectations(timeout:0.5) { (error:Error?) in
            XCTAssertTrue(called, "Not called")
        }
    }
    
    func testOpenProjectsNotifiesInteractor() {
        let expect:XCTestExpectation = self.expectation(description:String())
        var called:Bool = false
        self.interactor.onOpenProjects = {
            called = true
            expect.fulfill()
        }
        self.view.presenter.openProjects()
        self.waitForExpectations(timeout:0.5) { (error:Error?) in
            XCTAssertTrue(called, "Not called")
        }
    }
}
