import UIKit

class PresenterNewCard:PresenterItemProtocol {
    weak var view:View!
    weak var mapColumn:MapColumnProtocol!
    var viewItem:ViewItem
    var mapItem:MapItemProtocol
    var height:CGFloat
    
    required init() {
        self.viewItem = ViewNewCard()
        self.mapItem = MapNewCard()
        self.height = Constants.NewCard.height
    }
    
    func configureContent() { }
}
