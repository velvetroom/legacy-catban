import UIKit
import Board

class ViewModelBuilder {
    var viewModel:ViewModel
    private var project:ProjectManagedProtocol!
    
    init() {
        self.viewModel = ViewModel()
    }
    
    func buildWith(project:ProjectManagedProtocol) {
        self.project = project
        self.buildView()
        self.buildScroll()
        self.buildBoard()
        self.buildColumns()
    }
    
    private func buildView() {
        self.viewModel.view.title = self.project.name
    }
    
    private func buildScroll() {
        self.viewModel.scroll.contentSize = self.contentSize()
    }
    
    private func buildBoard() {
        self.viewModel.board.frame = CGRect(origin:CGPoint.zero, size:self.viewModel.scroll.contentSize)
    }
    
    private func buildColumns() {
        var left:CGFloat = ViewConstants.Board.paddingHorizontal
        self.project.iterate { (column:ColumnProtocol) in
            self.add(column:column, at:left)
            left += ViewConstants.Column.width + ViewConstants.Board.columnSpacing
        }
    }
    
    private func contentSize() -> CGSize {
        return CGSize(width:self.contentWidth(), height:self.contentHeight())
    }
    
    private func contentWidth() -> CGFloat {
        var width:CGFloat = CGFloat(self.project.countColumns) * ViewConstants.Column.width
        width += ViewConstants.Board.paddingHorizontal + ViewConstants.Board.paddingHorizontal
        return width
    }
    
    private func contentHeight() -> CGFloat {
        var height:CGFloat = ViewConstants.Column.titleHeight + ViewConstants.Column.paddingBottom
        height += CGFloat(self.maxCards()) * ViewConstants.Card.height
        return height
    }
    
    private func maxCards() -> Int {
        var max:Int = 0
        self.project.iterate { (column:ColumnProtocol) in
            if column.countCards > max {
                max = column.countCards
            }
        }
        return max
    }
    
    private func add(column:ColumnProtocol, at left:CGFloat) {
        var viewModel:ViewModelColumn = ViewModelColumn()
        viewModel.title = column.name
        viewModel.left = left
        self.viewModel.columns.append(viewModel)
    }
}
