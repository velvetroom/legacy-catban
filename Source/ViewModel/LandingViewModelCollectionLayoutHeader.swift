import UIKit

struct LandingViewModelCollectionLayoutHeader {
    var cells:[LandingViewModelCollectionLayoutCell]
    var frame:CGRect
    var index:IndexPath
    
    init() {
        self.cells = []
        self.frame = CGRect.zero
        self.index = IndexPath(item:0, section:0)
    }
}
