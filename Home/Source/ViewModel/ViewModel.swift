import UIKit

struct ViewModel {
    var viewTitle:String
    var scrollContentSize:CGSize
    var boardFrame:CGRect
    
    init() {
        self.viewTitle = String()
        self.scrollContentSize = CGSize.zero
        self.boardFrame = CGRect.zero
    }
}
