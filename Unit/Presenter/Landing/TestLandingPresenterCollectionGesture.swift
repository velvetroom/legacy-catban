import XCTest
@testable import catban

class TestLandingPresenterCollectionGesture:XCTestCase {
    private var presenter:LandingPresenterCollection!
    private var gesture:MockLandingPresentercollectionGesture!
    private var collection:MockLandingPresenterCollectionView!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.presenter = LandingPresenterCollection()
        self.gesture = MockLandingPresentercollectionGesture()
        self.collection = MockLandingPresenterCollectionView()
        self.collection.addGestureRecognizer(self.gesture)
    }
    
    func testLoad() {
        XCTAssertNotNil(self.presenter, "Failed to load presenter")
    }
    
    func testGestureShouldBegin() {
        self.collection.returnIndexPath = IndexPath(item:0, section:0)
        let shouldBegin:Bool = self.presenter.gesture.gestureRecognizerShouldBegin(self.gesture)
        XCTAssertTrue(shouldBegin, "Failed to load gesture recogniser to start")
    }
    
    func testGestureShouldNotBegin() {
        XCTAssertNil(self.collection.returnIndexPath)
        let shouldBegin:Bool = self.presenter.gesture.gestureRecognizerShouldBegin(self.gesture)
        XCTAssertFalse(shouldBegin, "Gesture recogniser should not begin")
    }
    
    func testGestureBegan() {
        self.startExpectation()
        self.gesture.fakeState = UIGestureRecognizerState.began
        self.collection.onBeginMovement = { [weak self] in
            self?.expect?.fulfill()
        }
        
        self.presenter.gesture.selectorGestureReceived(sender:self.gesture)
        
        self.waitExpectations()
    }
    
    func testGesturePossible() {
        self.startExpectation()
        self.gesture.fakeState = UIGestureRecognizerState.possible
        self.collection.onBeginMovement = { [weak self] in
            self?.expect?.fulfill()
        }
        
        self.presenter.gesture.selectorGestureReceived(sender:self.gesture)
        
        self.waitExpectations()
    }
    
    func testGestureChanged() {
        self.startExpectation()
        self.gesture.fakeState = UIGestureRecognizerState.changed
        self.collection.onUpdateMovement = { [weak self] in
            self?.expect?.fulfill()
        }
        
        self.presenter.gesture.selectorGestureReceived(sender:self.gesture)
        
        self.waitExpectations()
    }
    
    func testGestureEnded() {
        self.startExpectation()
        self.gesture.fakeState = UIGestureRecognizerState.ended
        self.collection.onEndMovement = { [weak self] in
            self?.expect?.fulfill()
        }
        
        self.presenter.gesture.selectorGestureReceived(sender:self.gesture)
        
        self.waitExpectations()
    }
    
    func testGestureCancelled() {
        self.startExpectation()
        self.gesture.fakeState = UIGestureRecognizerState.cancelled
        self.collection.onCancelMovement = { [weak self] in
            self?.expect?.fulfill()
        }
        
        self.presenter.gesture.selectorGestureReceived(sender:self.gesture)
        
        self.waitExpectations()
    }
    
    func testGestureFailed() {
        self.startExpectation()
        self.gesture.fakeState = UIGestureRecognizerState.failed
        self.collection.onCancelMovement = { [weak self] in
            self?.expect?.fulfill()
        }
        
        self.presenter.gesture.selectorGestureReceived(sender:self.gesture)
        
        self.waitExpectations()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Wait for expectation")
    }
    
    private func waitExpectations() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
