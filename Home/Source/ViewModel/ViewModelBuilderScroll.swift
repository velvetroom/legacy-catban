import UIKit
import Board

class ViewModelBuilderScroll:ViewModelBuilderProtocol {
    var project:ProjectManagedProtocol!
    var viewModel:ViewModel!
    
    required init() { }
    
    func build() -> ViewModel {
        self.viewModel.scroll.contentSize = self.contentSize()
        return self.viewModel
    }
    
    private func contentSize() -> CGSize {
        return CGSize(width:self.contentWidth(), height:self.contentHeight())
    }
    
    private func contentWidth() -> CGFloat {
        let spacingWidth:CGFloat = ViewConstants.Board.paddingHorizontal + ViewConstants.Board.paddingHorizontal
        return spacingWidth + self.columnsWidth()
    }
    
    private func contentHeight() -> CGFloat {
        let minimumHeight:CGFloat = max(UIScreen.main.bounds.width, UIScreen.main.bounds.height)
        return max(minimumHeight, self.columnHeight())
    }
    
    private func columnsWidth() -> CGFloat {
        let columnsWidth:CGFloat = CGFloat(self.project.countColumns) * ViewConstants.Column.width
        var columnsSpacing:CGFloat = 0
        if self.project.countColumns > 1 {
            columnsSpacing = CGFloat(self.project.countColumns - 1) * ViewConstants.Board.columnSpacing
        }
        return columnsWidth + columnsSpacing
    }
    
    private func columnHeight() -> CGFloat {
        return self.maxCardBottom() + ViewConstants.Column.paddingBottom
    }
    
    private func maxCardBottom() -> CGFloat {
        var maxBottom:CGFloat = 0
        for card:ViewModelCard in self.viewModel.cards {
            let bottom:CGFloat = card.top + card.height
            if bottom > maxBottom {
                maxBottom = bottom
            }
        }
        return maxBottom
    }
}