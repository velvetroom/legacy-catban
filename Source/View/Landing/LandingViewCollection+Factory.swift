import UIKit

extension LandingViewCollection {
    class func factoryLayout() -> UICollectionViewFlowLayout {
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.headerReferenceSize = CGSize(width:200, height:200)
        return layout
    }
}
