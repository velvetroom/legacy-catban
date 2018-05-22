import UIKit

protocol PresenterItemProtocol {
    var view:View! { get set }
    var mapColumn:MapColumnProtocol! { get set }
    var viewItem:ViewItemMapable { get }
    var mapItem:MapItemProtocol { get }
    var height:CGFloat { get set }
    
    init()
    func configureContent()
}
