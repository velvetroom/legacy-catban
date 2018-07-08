import UIKit

class ViewScanContent:UIView {
    weak var viewPreview:ViewScanPreview!
    weak var viewBar:ViewScanBar!
    weak var viewLoading:ViewScanLoading!
    
    init() {
        super.init(frame:CGRect.zero)
        self.makeOutlets()
        self.layoutOutlets()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    private func makeOutlets() {
        self.makePreview()
        self.makeLoading()
        self.makeBar()
    }
    
    private func layoutOutlets() {
        self.layoutPreview()
        self.layoutLoading()
        self.layoutBar()
    }
    
    private func makePreview() {
        let viewPreview:ViewScanPreview = ViewScanPreview()
        self.viewPreview = viewPreview
        self.addSubview(viewPreview)
    }
    
    private func makeBar() {
        let viewBar:ViewScanBar = ViewScanBar()
        self.viewBar = viewBar
        self.addSubview(viewBar)
    }
    
    private func makeLoading() {
        let viewLoading:ViewScanLoading = ViewScanLoading()
        self.viewLoading = viewLoading
        self.addSubview(viewLoading)
    }
    
    private func layoutPreview() {
        self.viewPreview.bottomAnchor.constraint(equalTo:self.bottomAnchor).isActive = true
        self.viewPreview.topAnchor.constraint(equalTo:self.topAnchor).isActive = true
        self.viewPreview.leftAnchor.constraint(equalTo:self.leftAnchor).isActive = true
        self.viewPreview.rightAnchor.constraint(equalTo:self.rightAnchor).isActive = true
    }
    
    private func layoutBar() {
        self.viewBar.topAnchor.constraint(equalTo:self.topAnchor).isActive = true
        self.viewBar.leftAnchor.constraint(equalTo:self.leftAnchor).isActive = true
        self.viewBar.rightAnchor.constraint(equalTo:self.rightAnchor).isActive = true
        self.viewBar.heightAnchor.constraint(equalToConstant:ViewConstants.Scan.barHeight).isActive = true
    }
    
    private func layoutLoading() {
        self.viewLoading.bottomAnchor.constraint(equalTo:self.bottomAnchor).isActive = true
        self.viewLoading.topAnchor.constraint(equalTo:self.topAnchor).isActive = true
        self.viewLoading.leftAnchor.constraint(equalTo:self.leftAnchor).isActive = true
        self.viewLoading.rightAnchor.constraint(equalTo:self.rightAnchor).isActive = true
    }
}
