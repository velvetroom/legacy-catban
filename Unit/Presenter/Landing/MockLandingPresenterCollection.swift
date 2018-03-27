import Foundation
@testable import catban

struct MockLandingPresenterCollection:LandingPresenterCollectionProtocol {
    let dataSource:LandingPresenterCollectionDataSource
    let delegate:LandingPresenterCollectionDelegate
    let gesture:LandingPresenterCollectionGesture
    
    init() {
        self.dataSource = MockLandingPresenterCollectionDataSource()
        self.delegate = LandingPresenterCollectionDelegate()
        self.gesture = LandingPresenterCollectionGesture()
    }
}
