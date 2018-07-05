import XCTest
import Board
@testable import Cloud

class TestInteractor_Share:XCTestCase {
    private var view:Cloud.View!
    private var project:ProjectSynchedProtocol!
    
    override func setUp() {
        super.setUp()
        self.view = Cloud.View()
        let original:ProjectProtocol = ProjectFactory.newProject()
        self.project = ProjectFactory.makeSynchable(project:original)
        self.view.presenter.interactor.project = self.project
    }
    
    func testGenerateQrReturnsImage() {
        let expect:XCTestExpectation = self.expectation(description:"Image not generated")
        self.view.presenter.interactor.generateQr { (image:UIImage) in
            XCTAssertEqual(Thread.current, Thread.main, "Invalid thread")
            expect.fulfill()
        }
        self.waitForExpectations(timeout:0.3, handler:nil)
    }
    
    func testValidateQrContent() {
        let remoteIdentifier:String = "lorem ipsum"
        self.project.remoteIdentifier = remoteIdentifier
        let expectedPrefix:String = "\(Constants.Qr.prefix)."
        let expectedSuffix:String = ".\(remoteIdentifier).\(Constants.Qr.suffix)"
        let content:String = self.view.presenter.interactor.qrContent
        XCTAssertTrue(content.contains(expectedSuffix), "Invalid content")
        XCTAssertTrue(content.contains(expectedPrefix), "Invalid content")
        print(content)
    }
}
