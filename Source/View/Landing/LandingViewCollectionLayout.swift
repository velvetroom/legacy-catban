import UIKit

class LandingViewCollectionLayout:UICollectionViewLayout {
    var viewModel:LandingViewModelCollectionLayout {
        didSet {
            print("update view model")
        }
    }
    var cellAttributes:[UICollectionViewLayoutAttributes]
    var headerAttributes:[UICollectionViewLayoutAttributes]
    
    override init() {
        self.viewModel = LandingViewModelCollectionLayout()
        self.cellAttributes = []
        self.headerAttributes = []
        super.init()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    override var collectionViewContentSize:CGSize {
        get {
            let contentSize:CGSize = self.viewModel.contentSize
            guard
                let viewHeight:CGFloat = self.collectionView?.bounds.height,
                viewHeight > contentSize.height
            else {
                return contentSize
            }
            
            return CGSize(width:contentSize.width, height:viewHeight)
        }
    }
    
    override func prepare() {
        super.prepare()
        print("return prepare")
        self.cellAttributes = []
        self.headerAttributes = []
        for header:LandingViewModelCollectionLayoutHeader in self.viewModel.headers {
            self.prepareHeadersFor(header:header)
            self.prepareCellsFor(header:header)
        }
    }
    
    override func layoutAttributesForElements(in rect:CGRect) -> [UICollectionViewLayoutAttributes]? {
        var attributesList:[UICollectionViewLayoutAttributes]? = self.findAttributesFor(
            rect:rect, in:self.cellAttributes)
        if let headerAttributes:[UICollectionViewLayoutAttributes] = self.findAttributesFor(
            rect:rect, in:self.headerAttributes) {
            if attributesList == nil {
                attributesList = []
            }
            attributesList?.append(contentsOf:headerAttributes)
        }
        return attributesList
    }
    
    override func layoutAttributesForItem(at index:IndexPath) -> UICollectionViewLayoutAttributes? {
        for attributes:UICollectionViewLayoutAttributes in self.cellAttributes {
            if attributes.indexPath == index {
                return attributes
            }
        }
        return nil
    }
    
    override func layoutAttributesForSupplementaryView(
        ofKind:String, at index:IndexPath) -> UICollectionViewLayoutAttributes? {
        for attributes:UICollectionViewLayoutAttributes in self.headerAttributes {
            if attributes.indexPath == index {
                return attributes
            }
        }
        return nil
    }
    
    override func invalidationContextForEndingInteractiveMovementOfItems(toFinalIndexPaths indexPaths: [IndexPath], previousIndexPaths: [IndexPath], movementCancelled: Bool) -> UICollectionViewLayoutInvalidationContext {
        print("asd")
        return super.invalidationContextForEndingInteractiveMovementOfItems(toFinalIndexPaths:indexPaths, previousIndexPaths:previousIndexPaths, movementCancelled:movementCancelled)
    }
    
    override func layoutAttributesForInteractivelyMovingItem(
        at index:IndexPath, withTargetPosition position:CGPoint) -> UICollectionViewLayoutAttributes {
        let attributes:UICollectionViewLayoutAttributes = super.layoutAttributesForInteractivelyMovingItem(
            at:index, withTargetPosition:position)
        attributes.alpha = Constants.alphaWhenMoving
        return attributes
    }
        
    override func shouldInvalidateLayout(forBoundsChange newBounds:CGRect) -> Bool {
        print("return true")
        return false
    }
    
    private func findAttributesFor(
        rect:CGRect, in list:[UICollectionViewLayoutAttributes]) -> [UICollectionViewLayoutAttributes]? {
        var attributesList:[UICollectionViewLayoutAttributes]?
        for attributes:UICollectionViewLayoutAttributes in list {
            if rect.intersects(attributes.frame) {
                if attributesList == nil {
                    attributesList = []
                }
                attributesList?.append(attributes)
            }
        }
        return attributesList
    }
    
    private func prepareHeadersFor(header:LandingViewModelCollectionLayoutHeader) {
        let attributes:UICollectionViewLayoutAttributes = UICollectionViewLayoutAttributes(
            forSupplementaryViewOfKind:UICollectionElementKindSectionHeader,
            with:header.index)
        attributes.frame = header.frame
        self.headerAttributes.append(attributes)
    }
    
    private func prepareCellsFor(header:LandingViewModelCollectionLayoutHeader) {
        for cell:LandingViewModelCollectionLayoutCell in header.cells {
            let attributes:UICollectionViewLayoutAttributes = UICollectionViewLayoutAttributes(
                forCellWith:cell.index)
            attributes.frame = cell.frame
            attributes.zIndex = Constants.cellZIndex
            self.cellAttributes.append(attributes)
        }
    }
    
    private func sectionFor(position:CGPoint) -> Int? {
        let positionX:CGFloat = position.x
        for header:UICollectionViewLayoutAttributes in self.headerAttributes {
            if header.frame.minX <= positionX && header.frame.maxX >= positionX {
                return header.indexPath.section
            }
        }
        return nil
    }
    
    override func shouldInvalidateLayout(forPreferredLayoutAttributes preferredAttributes: UICollectionViewLayoutAttributes, withOriginalAttributes originalAttributes: UICollectionViewLayoutAttributes) -> Bool {
        print("preferred")
        return false
    }
}
