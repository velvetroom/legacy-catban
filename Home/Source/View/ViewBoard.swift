import UIKit

class ViewBoard:UIView {
    var columns:[ViewColumn]
    var items:[ViewBoardItem]
    weak var dragDelegate:PresenterBoardDragProtocol!
    
    init() {
        self.columns = []
        self.items = []
        super.init(frame:CGRect.zero)
        self.clipsToBounds = true
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
}
