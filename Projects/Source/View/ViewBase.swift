import UIKit
import Shared

class ViewBase:UIView {
    weak var viewList:ViewList!
    weak var viewSelector:ViewListSelector!
    weak var viewMenu:ViewMenu!
    weak var viewEmpty:ViewEmpty!
    weak var viewRenamer:ViewRenamer!
    
    init() {
        super.init(frame:CGRect.zero)
        self.configureView()
        self.factoryViews()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    private func configureView() {
        self.clipsToBounds = true
        self.backgroundColor = UIColor.white
    }
    
    private func factoryViews() {
        self.factoryMenu()
        self.factoryList()
        self.factorySelector()
        self.factoryEmpty()
        self.factoryRenamer()
    }
}
