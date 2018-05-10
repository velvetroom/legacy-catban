import UIKit

struct ViewModelCard {
    var identifier:String
    var content:String
    var top:CGFloat
    var left:CGFloat
    var height:CGFloat
    var width:CGFloat
    
    init() {
        self.identifier = String()
        self.content = String()
        self.top = 0
        self.left = 0
        self.height = 0
        self.width = 0
    }
}
