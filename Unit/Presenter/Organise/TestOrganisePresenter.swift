import XCTest
@testable import catban

class TestOrganisePresenter:XCTestCase {
    private var presenter:OrganisePresenter!
    private var factory:MockOrganisePresenterFactoryProtocol!
    private var collectionDatasource:MockOrganisePresenterCollectionDatasourceProtocol!
    private var board:Board!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.presenter = OrganisePresenter()
        self.factory = MockOrganisePresenterFactoryProtocol()
        self.collectionDatasource = MockOrganisePresenterCollectionDatasourceProtocol()
        self.board = Board()
        self.presenter.factory = self.factory
        self.presenter.collection.datasource = self.collectionDatasource
    }
    
    func testLoad() {
        XCTAssertNotNil(self.presenter, "Failed to load presenter")
        XCTAssertNotNil(self.presenter.outlets, "Failed to load outlets")
        XCTAssertNotNil(self.presenter.collection, "Failed to load collection")
        XCTAssertNotNil(self.presenter.factory, "Failed to load factory")
        XCTAssertNotNil(self.board, "Failed to load board")
        XCTAssertNotNil(self.collectionDatasource, "Failed to load datasource")
    }
    
    func testUpdateViewModel() {
        self.startExpectation()
        self.factory.onFactoryWithBoard = { [weak self] (board:BoardProtocol) in
            let board:Board = board as! Board
            XCTAssertNotNil(board, "Invalid board received")
            XCTAssertTrue(board === self?.board, "Invalid board received")
            self?.expect?.fulfill()
        }
        
        self.presenter.updateWith(board:self.board)
        
        self.waitExpectations()
    }
    
    func testCollectionReceivesNewViewModel() {
        self.startExpectation()
        self.collectionDatasource.onViewModelSet = { [weak self] (viewModel:OrganiseViewModelCollection) in
            self?.expect?.fulfill()
        }
        
        self.presenter.updateWith(board:self.board)
        
        self.waitExpectations()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectations() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
