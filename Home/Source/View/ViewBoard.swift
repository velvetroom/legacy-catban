import UIKit

class ViewBoard:UIView {
    var columns:[ViewColumn]
    var cards:[ViewCard]
    
    init() {
        self.columns = []
        self.cards = []
        super.init(frame:CGRect.zero)
        self.clipsToBounds = true
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
}
