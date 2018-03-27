import XCTest
@testable import catban

class TestLandingPresenterCollection_Gesture:XCTestCase {
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
        self.gesture.fakeState = UIGestureRecognizerState.began
        self.collection.onBeginMovement = { [weak self] in
            self?.expect?.fulfill()
        }
        
        self.presenter.selectorGestureReceived(sender:self.gesture)
        
        self.waitExpectations()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Wait for expectation")
    }
    
    private func waitExpectations() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
