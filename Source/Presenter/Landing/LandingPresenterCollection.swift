import Foundation

struct LandingPresenterCollection:LandingPresenterCollectionProtocol {
    let delegate:LandingPresenterCollectionDelegate
    let dataSource:LandingPresenterCollectionDataSource
    let gesture:LandingPresenterCollectionGesture
    
    init() {
        self.delegate = LandingPresenterCollectionDelegate()
        self.dataSource = LandingPresenterCollectionDataSource()
        self.gesture = LandingPresenterCollectionGesture()
    }
}
