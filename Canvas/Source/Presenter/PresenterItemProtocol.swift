import UIKit

protocol PresenterItemProtocol {
    var view:View! { get set }
    var mapColumn:MapColumnProtocol! { get set }
    var viewItem:ViewItem { get }
    var mapItem:MapItemProtocol { get }
    var height:CGFloat { get set }
    
    init()
    func configureContent()
}
