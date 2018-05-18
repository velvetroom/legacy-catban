import UIKit
import Board

class PresenterCard:PresenterCardProtocol {
    weak var view:View!
    weak var mapColumn:MapColumn!
    weak var card:CardProtocol!
    var viewItem:ViewItem
    var mapItem:MapItemProtocol
    var height:CGFloat
    
    required init() {
        self.viewItem = ViewCard()
        self.mapItem = MapCard()
        self.height = 0
    }
    
    func configureContent() {
        let viewItem:ViewCard = self.viewItem as! ViewCard
        viewItem.identifier = self.card.identifier
        viewItem.labelContent.text = self.card.content
    }
}
