import XCTest
@testable import Tools

class TestDeleterView:XCTestCase {
    private var interactor:MockDeleterInteractorProtocol!
    private var deleter:DeleterView<MockDeleterInteractorProtocol>!
    private var presenter:MockDeleterPresenter!
    
    override func setUp() {
        super.setUp()
        self.interactor = MockDeleterInteractorProtocol()
        self.deleter = DeleterFactory.makeWith(
            interactor:self.interactor, and:DeleterViewModel()) as! DeleterView<MockDeleterInteractorProtocol>
        self.presenter = MockDeleterPresenter()
        self.deleter.presenter = self.presenter
    }
    
    func testCancelCloseDeleter() {
        
    }
    
    func testCancelCallsPresenter() {
        
    }
}
