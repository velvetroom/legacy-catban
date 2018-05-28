import UIKit

class ViewList:UICollectionView {
    var presenter:PresenterList
    
    init() {
        self.presenter = PresenterList()
        let flow:ViewListFlow = ViewListFlow()
        super.init(frame:CGRect.zero, collectionViewLayout:flow)
        self.configureView()
        self.factoryViews()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    private func configureView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.clipsToBounds = true
    }
    
    private func factoryViews() {
        
    }
}
