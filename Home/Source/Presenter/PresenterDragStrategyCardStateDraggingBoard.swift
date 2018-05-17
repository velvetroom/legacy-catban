import UIKit

class PresenterDragStrategyCardStateDraggingBoard {
    weak var view:ViewBoardItem!
    weak var viewBoard:ViewBoard!
    
    func prospectPositionFor(rect:CGRect) -> CGPoint {
        guard
            let column:ViewColumn = self.columnAtPosition(rect:rect)
        else { return CGPoint.zero }
        let allCards:[ViewCard] = self.cardsIn(column:column)
        if allCards.isEmpty {
            return CGPoint(x:column.layoutLeft.constant, y:ViewConstants.ColumnTitle.height)
        } else {
            for card:ViewCard in allCards {
                
            }
            
            return CGPoint.zero
        }
    }
    
    func columnAtPosition(rect:CGRect) -> ViewColumn? {
        let midX:CGFloat = rect.midX
//        for column:ViewColumn in self.viewBoard.columns {
//            if column.frame.maxX >= midX {
//                return column
//            }
//        }
        return nil
    }
    
    func cardsBelow(rect:CGRect) -> [ViewCard] {
        guard
            let column:ViewColumn = self.columnAtPosition(rect:rect)
        else { return [] }
        let allCards:[ViewCard] = self.cardsIn(column:column)
        var belowRect:[ViewCard] = []
        for card:ViewCard in allCards {
            if card.layoutTop.constant > rect.midY {
                belowRect.append(card)
            }
        }
        return belowRect
    }
    
    private func cardsIn(column:ViewColumn) -> [ViewCard] {
        var cards:[ViewCard] = []
//        for item:ViewBoardItem in self.viewBoard.items {
//            guard
//                self.view != item,
//                let card:ViewCard = item as? ViewCard
//            else { continue }
//            if self.isChild(card:card, of:column) {
//                cards.append(card)
//            }
//        }
        return cards
    }
    
    private func isChild(card:ViewCard, of column:ViewColumn) -> Bool {
        if card.layoutLeft.constant > column.layoutLeft.constant {
            if column.layoutLeft.constant + ViewConstants.Column.width > card.layoutLeft.constant {
                return true
            }
        }
        return false
    }
}
