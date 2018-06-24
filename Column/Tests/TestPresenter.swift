import XCTest
import Board
@testable import Shared
@testable import Column

class TestPresenter:XCTestCase {
    private var view:Column.View!
    private var column:ColumnProtocol!
    private var interactor:MockInteractor!
    
    override func setUp() {
        super.setUp()
        self.view = Column.View()
        self.column = ColumnFactory.newColumn()
        self.interactor = MockInteractor()
        self.view.presenter.interactor = self.interactor
        self.interactor.column = self.column
    }
}
