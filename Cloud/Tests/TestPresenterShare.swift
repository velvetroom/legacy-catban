import XCTest
import Shared
@testable import Cloud

class TestPresenterShare:XCTestCase {
    private var view:Cloud.ViewShare!
    private var interactor:MockInteractor!
    
    override func setUp() {
        super.setUp()
        Configuration.repositoryProjectType = MockRepositoryProjectProtocol.self
        self.view = Cloud.ViewShare()
        self.interactor = MockInteractor()
        self.view.presenter.interactor = self.interactor
    }
    
    func testCallsGenerateQrOnDidAppear() {
        var called:Bool = false
        self.interactor.onGenerateQr = { called = true }
        self.view.presenter.didAppear()
        XCTAssertTrue(called, "Not called")
    }
    
    func testUpdateViewModelOnQrGenerated() {
        let expect:XCTestExpectation = self.expectation(description:"Not updated")
        self.interactor.image = UIImage()
        var viewModel:ViewModelQr = self.view.viewModel.property()
        viewModel.observing = { (property:ViewModelQr) in
            if property.image != nil {
                expect.fulfill()
            }
        }
        self.view.viewModel.update(property:viewModel)
        self.view.presenter.didAppear()
        self.waitForExpectations(timeout:0.3, handler:nil)
    }
}
