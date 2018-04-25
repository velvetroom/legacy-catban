import UIKit

class StatsViewCollectionLayout:UICollectionViewLayout {
    var attributes:[UICollectionViewLayoutAttributes]
    
    override init() {
        self.attributes = []
        super.init()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    override var collectionViewContentSize:CGSize {
        get {
            guard
                let view:UICollectionView = self.collectionView
            else { return CGSize.zero }
            let items:Int = view.numberOfItems(inSection:0)
            let viewSize:CGSize = view.bounds.size
            let width:CGFloat = CGFloat(items) * viewSize.width
            return CGSize(width:width, height:viewSize.height)
        }
    }
    
    override func prepare() {
        super.prepare()
        if let view:UICollectionView = self.collectionView {
            let items:Int = view.numberOfItems(inSection:0)
            let viewSize:CGSize = view.bounds.size
            self.attributes = self.attributesFor(items:items, in:viewSize)
        } else {
            self.attributes = []
        }
    }
    
    override func layoutAttributesForElements(in rect:CGRect) -> [UICollectionViewLayoutAttributes]? {
        var list:[UICollectionViewLayoutAttributes]?
        for attributes:UICollectionViewLayoutAttributes in self.attributes {
            if rect.intersects(attributes.frame) {
                if list == nil {
                    list = []
                }
                list?.append(attributes)
            }
        }
        return list
    }
    
    override func layoutAttributesForItem(at index:IndexPath) -> UICollectionViewLayoutAttributes? {
        return self.attributes[index.item]
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds:CGRect) -> Bool {
        return true
    }
    
    private func attributesFor(items:Int, in size:CGSize) -> [UICollectionViewLayoutAttributes] {
        var list:[UICollectionViewLayoutAttributes] = []
        for index:Int in 0 ..< items {
            let indexPath:IndexPath = IndexPath(item:index, section:0)
            let x:CGFloat = CGFloat(index) * size.width
            let attributes:UICollectionViewLayoutAttributes = UICollectionViewLayoutAttributes(
                forCellWith:indexPath)
            attributes.frame = CGRect(x:x, y:0, width:size.width, height:size.height)
            list.append(attributes)
        }
        return list
    }
}
