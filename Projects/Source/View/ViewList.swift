import UIKit

class ViewList:UIView {
    var presenter:PresenterList
    
    init() {
        self.presenter = PresenterList()
        super.init(frame:CGRect.zero)
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
