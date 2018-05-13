import UIKit

class ViewNewCard:ViewBoardItem {
    override init() {
        super.init()
        self.backgroundColor = UIColor.red
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    override func selectorButton(sender button:UIButton) {
        
    }
}
