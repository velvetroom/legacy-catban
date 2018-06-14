import Foundation
import Shared

public struct ViewModel:ViewModelProtocol {
    var view:ViewModelView
    var text:ViewModelText
    
    public init() {
        self.view = ViewModelView()
        self.text = ViewModelText()
    }
}
