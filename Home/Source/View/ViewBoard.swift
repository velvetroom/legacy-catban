import UIKit

class ViewBoard:UIView {
    var columns:[ViewColumn]
    
    init() {
        self.columns = []
        super.init(frame:CGRect.zero)
        self.clipsToBounds = true
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
}
