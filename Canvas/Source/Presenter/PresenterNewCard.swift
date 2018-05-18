import UIKit

class PresenterNewCard:PresenterItemProtocol {
    weak var view:View!
    weak var mapColumn:MapColumn!
    var viewItem:ViewItem
    var mapItem:MapItemProtocol
    var height:CGFloat
    
    required init() {
        self.viewItem = ViewNewCard()
        self.mapItem = MapNewCard()
        self.height = ViewConstants.NewCard.height
    }
    
    func configureContent() { }
}
