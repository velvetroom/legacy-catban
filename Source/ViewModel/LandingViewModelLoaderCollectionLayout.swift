import UIKit

class LandingViewModelLoaderCollectionLayout {
    func factoryWith(project:Project) -> LandingViewModelCollectionLayout {
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
        header.frame = self.factoryFrameForHeaderWith(column:column, at:index)
        header.index = IndexPath(item:0, section:index)
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
        maxY += Constants.interItemSeparation
        return CGSize(width:maxX, height:maxY)
    }
    
    private func factoryHeaderHeightWith(column:ProjectColumn) -> CGFloat {
        var height:CGFloat = Constants.headerInsetTop + Constants.headerInsetBottom
        for _:ProjectCard in column.cards {
            height += Constants.cellHeight + Constants.interCellSeparation
        }
        return height
    }
}
