import UIKit

class LandingViewModelLoaderCollectionLayout {
    func factoryWith(project:Project) -> LandingViewModelCollectionLayout {
        var layout:LandingViewModelCollectionLayout = LandingViewModelCollectionLayout()
        for column:ProjectColumn in project.columns {
            let index:Int = layout.headers.count
            let header:LandingViewModelCollectionLayoutHeader = self.factoryHeaderWith(column:column, at:index)
            layout.headers.append(header)
        }
        return layout
    }
    
    private func factoryHeaderWith(column:ProjectColumn, at index:Int) -> LandingViewModelCollectionLayoutHeader {
        var header:LandingViewModelCollectionLayoutHeader = LandingViewModelCollectionLayoutHeader()
        header.frame = self.factoryFrameForHeaderAt(index:index)
        header.index = IndexPath(item:0, section:index)
        return header
    }
    
    private func factoryFrameForHeaderAt(index:Int) -> CGRect {
        let x:CGFloat = self.factoryXForHeaderAt(index:index)
        let frame:CGRect = CGRect(
            x:x,
            y:Constants.interItemSeparation,
            width:Constants.headerWidth,
            height:800)
        return frame
    }
    
    private func factoryXForHeaderAt(index:Int) -> CGFloat {
        let index:CGFloat = CGFloat(index)
        let separation:CGFloat = (index * Constants.interItemSeparation) + Constants.interItemSeparation
        let headers:CGFloat = index * Constants.headerWidth
        return separation + headers
    }
}
