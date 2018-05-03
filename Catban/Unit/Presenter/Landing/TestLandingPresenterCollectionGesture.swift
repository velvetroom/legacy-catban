import XCTest
@testable import catban

class TestLandingPresenterCollectionGesture:XCTestCase {
    private var presenter:LandingPresenterCollectionGesture!
    private var gesture:MockLandingPresenterCollectionGesture!
    private var collection:MockLandingPresenterCollectionView!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.presenter = LandingPresenterCollectionGesture()
        self.gesture = MockLandingPresenterCollectionGesture()
        self.collection = MockLandingPresenterCollectionView()
        self.collection.addGestureRecognizer(self.gesture)
        self.presenter.movingCellDelta = CGPoint.zero
    }
    
    func testLoad() {
        XCTAssertNotNil(self.presenter, "Failed to load presenter")
        XCTAssertNotNil(self.gesture, "Failed to load gesture")
        XCTAssertNotNil(self.collection, "Failed to load collection")
        XCTAssertNotNil(self.presenter.movingCellDelta, "Failed to load moving cell delta")
    }
    
    func testGestureShouldBegin() {
        self.configureCollection()
        let shouldBegin:Bool = self.presenter.gestureRecognizerShouldBegin(self.gesture)
        XCTAssertTrue(shouldBegin, "Failed to load gesture recogniser to start")
    }
    
    func testGestureShouldNotBegin() {
        XCTAssertNil(self.collection.returnIndexPath)
        let shouldBegin:Bool = self.presenter.gestureRecognizerShouldBegin(self.gesture)
        XCTAssertFalse(shouldBegin, "Gesture recogniser should not begin")
    }
    
    func testGestureBegan() {
        self.startExpectation()
        self.configureCollection()
        self.gesture.fakeState = UIGestureRecognizerState.began
        self.collection.onBeginMovement = { [weak self] in
            XCTAssertNotNil(self?.presenter.movingCellDelta, "Moving cell delta not found")
            self?.expect?.fulfill()
        }
        
        self.presenter.selectorGestureReceived(sender:self.gesture)
        
        self.waitExpectations()
    }
    
    func testGesturePossible() {
        self.startExpectation()
        self.configureCollection()
        self.gesture.fakeState = UIGestureRecognizerState.possible
        self.collection.onBeginMovement = { [weak self] in
            XCTAssertNotNil(self?.presenter.movingCellDelta, "Moving cell delta not found")
            self?.expect?.fulfill()
        }
        
        self.presenter.selectorGestureReceived(sender:self.gesture)
        
        self.waitExpectations()
    }
    
    func testGestureChanged() {
        self.startExpectation()
        self.configureCollection()
        self.gesture.fakeState = UIGestureRecognizerState.changed
        self.collection.onUpdateMovement = { [weak self] in
            XCTAssertNotNil(self?.presenter.movingCellDelta, "Moving cell delta not found")
            self?.expect?.fulfill()
        }
        
        self.presenter.selectorGestureReceived(sender:self.gesture)
        
        self.waitExpectations()
    }
    
    func testGestureEnded() {
        self.startExpectation()
        self.gesture.fakeState = UIGestureRecognizerState.ended
        self.collection.onEndMovement = { [weak self] in
            XCTAssertNil(self?.presenter.movingCellDelta, "Moving cell delta should not be there")
            self?.expect?.fulfill()
        }
        
        self.presenter.selectorGestureReceived(sender:self.gesture)
        
        self.waitExpectations()
    }
    
    func testGestureCancelled() {
        self.startExpectation()
        self.gesture.fakeState = UIGestureRecognizerState.cancelled
        self.collection.onCancelMovement = { [weak self] in
            XCTAssertNil(self?.presenter.movingCellDelta, "Moving cell delta should not be there")
            self?.expect?.fulfill()
        }
        
        self.presenter.selectorGestureReceived(sender:self.gesture)
        
        self.waitExpectations()
    }
    
    func testGestureFailed() {
        self.startExpectation()
        self.gesture.fakeState = UIGestureRecognizerState.failed
        self.collection.onCancelMovement = { [weak self] in
            self?.expect?.fulfill()
        }
        
        self.presenter.selectorGestureReceived(sender:self.gesture)
        
        self.waitExpectations()
    }
    
    private func configureCollection() {
        self.collection.returnIndexPath = IndexPath(item:0, section:0)
        self.collection.returnCell = UICollectionViewCell()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Wait for expectation")
    }
    
    private func waitExpectations() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
