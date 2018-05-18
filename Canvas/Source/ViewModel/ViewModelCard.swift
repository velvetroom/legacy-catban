import UIKit

struct ViewModelCard:ViewModelProtocol {
    var identifier:String
    var content:String
    var height:CGFloat
    
    init() {
        self.identifier = String()
        self.content = String()
        self.height = 0
    }
}
