import UIKit

class PresenterDragStrategyCardStateDraggingBoard {
    weak var view:ViewBoardItem!
    weak var viewBoard:ViewBoard!
    
    func columnAtPosition(rect:CGRect) -> ViewColumn? {
        let midX:CGFloat = rect.midX
        for column:ViewColumn in self.viewBoard.columns {
            if column.frame.maxX >= midX {
                return column
            }
        }
        return nil
    }
}
