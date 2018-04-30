import XCTest
@testable import catban

class TestStatsPresenter:XCTestCase {
    private var presenter:StatsPresenter!
    private var factory:MockStatsPresenterFactoryProtocol!
    private var board:Board!
    private var pageControl:MockStatsViewPageControl!
    private var collectionDatasource:MockStatsPresenterCollectionDatasourceProtocol!
    private var items:[StatsItemProtocol]!
    private var expect:XCTestExpectation?
    private var outlets:StatsPresenterOutlets {
        get {
            return self.presenter.outlets
        }
        set(newValue) {
            self.presenter.outlets = newValue
        }
    }
    
    private struct Constants {
        static let items:[UIView] = [
            MockStatsView()]
        static let wait:TimeInterval = 0.3
        static let numberOfPages:Int = 1
    }
    
    override func setUp() {
        super.setUp()
        self.presenter = StatsPresenter()
        self.factory = MockStatsPresenterFactoryProtocol()
        self.board = Board()
        self.pageControl = MockStatsViewPageControl()
        self.collectionDatasource = MockStatsPresenterCollectionDatasourceProtocol()
        self.items = Stats.factoryItems()
        self.outlets.pageControl = self.pageControl
        self.presenter.factory = self.factory
        self.presenter.collection.datasource = self.collectionDatasource
        self.factory.viewModel.pageControl.numberOFPages = Constants.numberOfPages
        self.factory.viewModel.collection.items = Constants.items
    }
    
    func testLoad() {
        XCTAssertNotNil(self.presenter, "Failed to load presenter")
        XCTAssertNotNil(self.presenter.outlets, "Failed to load outlets")
        XCTAssertNotNil(self.presenter.collection, "Failed to load collection")
        XCTAssertNotNil(self.factory, "Failed to load factory")
        XCTAssertNotNil(self.board, "Failed to load view model")
        XCTAssertNotNil(self.pageControl, "Failed to load page control")
        XCTAssertNotNil(self.collectionDatasource, "Failed to load collection data source")
        XCTAssertNotNil(self.items, "Failed to load items")
    }
    
    func testUpdateWithFactoriesNewViewModel() {
        self.startExpectation()
        self.factory.onFactoryWithBoard = { [weak self] (board:BoardProtocol, items:[StatsItemProtocol]) in
            let board:Board = board as! Board
            XCTAssertEqual(self?.items.count, items.count, "Invalid items received")
            XCTAssertTrue(board === self?.board, "Invalid board received")
            self?.expect?.fulfill()
        }
        
        self.presenter.updateWith(board:self.board, for:self.items)
        
        self.waitExpectations()
    }
    
    func testUpdateWithUpdatesNumberOfPages() {
        self.presenter.updateWith(board:self.board, for:self.items)
        XCTAssertEqual(Constants.numberOfPages, self.pageControl.numberOfPages,
                       "Failed to update number of pages")
    }
    
    func testUpdateCollectionDatasource() {
        self.presenter.updateWith(board:self.board, for:self.items)
        XCTAssertEqual(Constants.items.count, self.presenter.collection.datasource.viewModel.items.count,
                       "Failed to update collection")
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectations() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
