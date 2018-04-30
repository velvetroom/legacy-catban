import UIKit

struct LandingViewModelCollectionLayout {
    var headers:[LandingViewModelCollectionLayoutHeader]
    var contentSize:CGSize
    
    init() {
        self.headers = []
        self.contentSize = CGSize.zero
    }
}
