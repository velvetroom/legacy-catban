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
            let attributesSublist:[UICollectionViewLayoutAttributes] = self.prepareFor(header:header)
            attributesList.append(contentsOf:attributesSublist)
        }
        self.attributesList = attributesList
    }
    
    override func layoutAttributesForElements(in rect:CGRect) -> [UICollectionViewLayoutAttributes]? {
        var attributesList:[UICollectionViewLayoutAttributes]?
        for attributes:UICollectionViewLayoutAttributes in self.attributesList {
            guard
                rect.intersects(attributes.frame)
            else {
                continue
            }
            if attributesList == nil {
                attributesList = []
            }
            attributesList?.append(attributes)
        }
        return attributesList
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
    
    private func prepareFor(header:LandingViewModelCollectionLayoutHeader) -> [UICollectionViewLayoutAttributes] {
        let headerAttributes:UICollectionViewLayoutAttributes = self.prepareAttributesFor(header:header)
        let cellAttributes:[UICollectionViewLayoutAttributes] = self.prepareCellsFor(header:header)
        var attributesList:[UICollectionViewLayoutAttributes] = []
        attributesList.append(headerAttributes)
        attributesList.append(contentsOf:cellAttributes)
        return attributesList
    }
    
    private func prepareAttributesFor(
        header:LandingViewModelCollectionLayoutHeader) -> UICollectionViewLayoutAttributes {
        let attributes:UICollectionViewLayoutAttributes = UICollectionViewLayoutAttributes(
            forSupplementaryViewOfKind:UICollectionElementKindSectionHeader,
            with:header.index)
        attributes.frame = header.frame
        return attributes
    }
    
    private func prepareCellsFor(
        header:LandingViewModelCollectionLayoutHeader) -> [UICollectionViewLayoutAttributes] {
        var attributesList:[UICollectionViewLayoutAttributes] = []
        for cell:LandingViewModelCollectionLayoutCell in header.cells {
            let attributes:UICollectionViewLayoutAttributes = self.prepareAttributesFor(cell:cell)
            attributesList.append(attributes)
        }
        return attributesList
    }
    
    private func prepareAttributesFor(
        cell:LandingViewModelCollectionLayoutCell) -> UICollectionViewLayoutAttributes {
        let attributes:UICollectionViewLayoutAttributes = UICollectionViewLayoutAttributes(forCellWith:cell.index)
        attributes.frame = cell.frame
        return attributes
    }
}
