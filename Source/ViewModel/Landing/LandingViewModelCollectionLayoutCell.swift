import UIKit

struct LandingViewModelCollectionLayoutCell {
    var frame:CGRect
    var index:IndexPath
    
    init() {
        self.frame = CGRect.zero
        self.index = IndexPath(item:0, section:0)
    }
}
