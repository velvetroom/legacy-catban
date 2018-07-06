import UIKit

class ViewScanContent:UIView {
    weak var viewBar:ViewScanBar!
    
    init() {
        super.init(frame:CGRect.zero)
        self.configureView()
        self.makeOutlets()
        self.layoutOutlets()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    private func configureView() {
        self.backgroundColor = UIColor.black
    }
    
    private func makeOutlets() {
        self.makeBar()
    }
    
    private func layoutOutlets() {
        self.layoutBar()
    }
    
    private func makeBar() {
        let viewBar:ViewScanBar = ViewScanBar()
        self.viewBar = viewBar
        self.addSubview(viewBar)
    }
    
    private func layoutBar() {
        self.viewBar.topAnchor.constraint(equalTo:self.topAnchor).isActive = true
        self.viewBar.leftAnchor.constraint(equalTo:self.leftAnchor).isActive = true
        self.viewBar.rightAnchor.constraint(equalTo:self.rightAnchor).isActive = true
        self.viewBar.heightAnchor.constraint(equalToConstant:ViewConstants.Scan.barHeight).isActive = true
    }
}
