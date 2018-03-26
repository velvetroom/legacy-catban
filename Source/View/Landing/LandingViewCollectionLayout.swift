import UIKit

class LandingViewCollectionLayout:UICollectionViewLayout {
    var viewModel:LandingViewModelCollectionLayout
    var attributesList:[UICollectionViewLayoutAttributes]
    
    override init() {
        self.viewModel = LandingViewModelCollectionLayout()
        self.attributesList = []
        super.init()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    override var collectionViewContentSize:CGSize {
        get {
            return self.viewModel.contentSize
        }
    }
    
    override func prepare() {
        super.prepare()
        var attributesList:[UICollectionViewLayoutAttributes] = []
        
        for header:LandingViewModelCollectionLayoutHeader in self.viewModel.headers {
//            let attributes:UICollectionViewLayoutAttributes = UICollectionViewLayoutAttributes(
//                forSupplementaryViewOfKind:UICollectionElementKindSectionHeader,
//                with:)
        }
        
        self.attributesList = attributesList
    }
    
    override func layoutAttributesForElements(in rect:CGRect) -> [UICollectionViewLayoutAttributes]? {
        return nil
    }
    
    override func layoutAttributesForItem(at indexPath:IndexPath) -> UICollectionViewLayoutAttributes? {
        return nil
    }
    
    override func layoutAttributesForSupplementaryView(
        ofKind elementKind:String, at indexPath:IndexPath) -> UICollectionViewLayoutAttributes? {
        return nil
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds:CGRect) -> Bool {
        return false
    }
}
