import XCTest
@testable import Projects

class TestInteractor:XCTestCase {
    private var view:View!
    private var interactor:Interactor!
    
    override func setUp() {
        super.setUp()
        self.view = View()
        self.interactor = self.view.presenter.interactor
    }
    
    
}
