import Foundation
import Shared

public protocol PresenterDeleteProtocol {
    var delegate:PresenterDeleteDelegateProtocol? { get set }
    var presentingView:ViewProtocol! { get set }
    var itemName:String { get set }
    
    func askConfirmation()
}
