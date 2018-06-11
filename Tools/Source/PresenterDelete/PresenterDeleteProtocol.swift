import Foundation
import Shared

public protocol PresenterDeleteProtocol {
    var delegate:PresenterDeleteDelegateProtocol? { get set }
    var presentingView:PresentingViewProtocol! { get set }
    var itemName:String { get set }
    
    func askConfirmation()
}
