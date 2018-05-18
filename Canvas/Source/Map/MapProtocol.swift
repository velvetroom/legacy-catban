import UIKit

protocol MapProtocol:MapEditorProtocol {
    var mapDelegate:MapDelegateProtocol! { get set }
    var size:CGSize { get }
}
