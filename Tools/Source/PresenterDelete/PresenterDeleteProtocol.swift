import UIKit

public protocol PresenterDeleteProtocol {
    var delegate:PresenterDeleteDelegateProtocol? { get set }
    var presentingView:UIViewController? { get set }
    var itemName:String { get set }
}
