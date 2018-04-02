import UIKit

class LandingViewModelLoaderCollectionLayout {
    private var cellWidth:CGFloat {
        get {
            return Constants.headerWidth - (Constants.interCellSeparation * 2)
        }
    }
    
    func factoryWith(model:LandingProtocol) -> LandingViewModelCollectionLayout {
        let layout:LandingViewModelCollectionLayout
        if let project:ProjectProtocol = model.project {
            layout = self.factoryWith(project:project)
        } else {
            layout = LandingViewModelCollectionLayout()
        }
        return layout
    }
    
    private func factoryWith(project:ProjectProtocol) -> LandingViewModelCollectionLayout {
        var layout:LandingViewModelCollectionLayout = LandingViewModelCollectionLayout()
        for column:ProjectColumn in project.columns {
            let index:Int = layout.headers.count
            let header:LandingViewModelCollectionLayoutHeader = self.factoryHeaderWith(column:column, at:index)
            layout.headers.append(header)
        }
        layout.contentSize = self.factoryContentSizeWith(layout:layout)
        return layout
    }
    
    private func factoryHeaderWith(column:ProjectColumn, at index:Int) -> LandingViewModelCollectionLayoutHeader {
        var header:LandingViewModelCollectionLayoutHeader = LandingViewModelCollectionLayoutHeader()
        header.index = IndexPath(item:0, section:index)
        header.frame = self.factoryFrameForHeaderWith(column:column, at:index)
        header.cells = self.factoryCellsWith(column:column, in:header)
        return header
    }
    
    private func factoryFrameForHeaderWith(column:ProjectColumn, at index:Int) -> CGRect {
        let x:CGFloat = self.factoryXForHeaderAt(index:index)
        let height:CGFloat = self.factoryHeaderHeightWith(column:column)
        let frame:CGRect = CGRect(
            x:x,
            y:Constants.interItemSeparation,
            width:Constants.headerWidth,
            height:height)
        return frame
    }
    
    private func factoryXForHeaderAt(index:Int) -> CGFloat {
        let index:CGFloat = CGFloat(index)
        let separation:CGFloat = (index * Constants.interItemSeparation) + Constants.interItemSeparation
        let headers:CGFloat = index * Constants.headerWidth
        return separation + headers
    }
    
    private func factoryHeaderHeightWith(column:ProjectColumn) -> CGFloat {
        var height:CGFloat = Constants.headerInsetTop + Constants.headerInsetBottom
        for _:ProjectCard in column.cards {
            height += Constants.cellHeight + Constants.interCellSeparation
        }
        return height
    }
    
    private func factoryCellsWith(
        column:ProjectColumn,
        in header:LandingViewModelCollectionLayoutHeader) -> [LandingViewModelCollectionLayoutCell] {
        let count:Int = column.cards.count
        var cells:[LandingViewModelCollectionLayoutCell] = []
        for index:Int in 0 ..< count {
            let cell:LandingViewModelCollectionLayoutCell = self.factoryCellIn(header:header, at:index)
            cells.append(cell)
        }
        return cells
    }
    
    private func factoryCellIn(header:LandingViewModelCollectionLayoutHeader,
                               at index:Int) -> LandingViewModelCollectionLayoutCell {
        var cell:LandingViewModelCollectionLayoutCell = LandingViewModelCollectionLayoutCell()
        cell.frame = self.factoryFrameForCellIn(header:header, at:index)
        cell.index = IndexPath(item:index, section:header.index.section)
        return cell
    }
    
    private func factoryFrameForCellIn(header:LandingViewModelCollectionLayoutHeader,
                                       at index:Int) -> CGRect {
        let frame:CGRect = CGRect(
            x:header.frame.minX + Constants.interCellSeparation,
            y:self.factoryYForCellIn(header:header, at:index),
            width:self.cellWidth,
            height:Constants.cellHeight)
        return frame
    }
    
    private func factoryYForCellIn(header:LandingViewModelCollectionLayoutHeader,
                                   at index:Int) -> CGFloat {
        let index:CGFloat = CGFloat(index)
        var y:CGFloat = header.frame.minY
        y += Constants.headerInsetTop
        y += index * (Constants.cellHeight + Constants.interCellSeparation)
        y += Constants.interCellSeparation
        return y
    }
    
    private func factoryContentSizeWith(layout:LandingViewModelCollectionLayout) -> CGSize {
        var maxX:CGFloat = 0
        var maxY:CGFloat = 0
        for header:LandingViewModelCollectionLayoutHeader in layout.headers {
            let headerMaxX:CGFloat = header.frame.maxX
            let headerMaxY:CGFloat = header.frame.maxY
            if headerMaxX > maxX {
                maxX = headerMaxX
            }
            if headerMaxY > maxY {
                maxY = headerMaxY
            }
        }
        maxX += Constants.interItemSeparation
        maxY += Constants.interItemSeparation + Constants.headerOutsetBottom
        return CGSize(width:maxX, height:maxY)
    }
}
