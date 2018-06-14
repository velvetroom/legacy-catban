import UIKit

class ViewList:UICollectionView {
    weak var viewSelector:ViewSelector!
    var trackingScroll:Bool
    
    init() {
        let flow:ViewListFlow = ViewListFlow()
        self.trackingScroll = true
        super.init(frame:CGRect.zero, collectionViewLayout:flow)
        self.configureView()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    func updateLayout() {
        self.collectionViewLayout.invalidateLayout()
        DispatchQueue.main.async { [weak self] in
            self?.updateSelector()
        }
    }
    
    func updateSelector() {
        self.delegate?.scrollViewDidScroll?(self)
    }
    
    private func configureView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.clipsToBounds = true
        self.backgroundColor = UIColor.clear
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
        self.alwaysBounceVertical = true
        self.canCancelContentTouches = false
        self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentBehavior.never
        self.decelerationRate = UIScrollViewDecelerationRateFast
        self.register(ViewListCell.self, forCellWithReuseIdentifier:ViewConstants.ListItem.identifier)
    }
}
