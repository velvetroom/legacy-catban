import UIKit

class ViewScanContent:UIView {
    weak var viewPreview:ViewScanPreview!
    weak var viewBase:ViewScanBase!
    weak var viewBar:ViewScanBar!
    
    init() {
        super.init(frame:CGRect.zero)
        self.makeOutlets()
        self.layoutOutlets()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    private func makeOutlets() {
        self.makeBase()
        self.makePreview()
        self.makeBar()
    }
    
    private func layoutOutlets() {
        self.layoutBase()
        self.layoutPreview()
        self.layoutBar()
    }
    
    private func makePreview() {
        let viewPreview:ViewScanPreview = ViewScanPreview()
        self.viewPreview = viewPreview
        self.addSubview(viewPreview)
    }
    
    private func makeBase() {
        let viewBase:ViewScanBase = ViewScanBase()
        self.viewBase = viewBase
        self.addSubview(viewBase)
    }
    
    private func makeBar() {
        let viewBar:ViewScanBar = ViewScanBar()
        self.viewBar = viewBar
        self.addSubview(viewBar)
    }
    
    private func layoutPreview() {
        self.viewPreview.bottomAnchor.constraint(equalTo:self.viewBase.bottomAnchor).isActive = true
        self.viewPreview.topAnchor.constraint(equalTo:self.viewBase.topAnchor).isActive = true
        self.viewPreview.leftAnchor.constraint(equalTo:self.viewBase.leftAnchor).isActive = true
        self.viewPreview.rightAnchor.constraint(equalTo:self.viewBase.rightAnchor).isActive = true
    }
    
    private func layoutBase() {
        self.viewBase.layoutTop = self.viewBase.topAnchor.constraint(equalTo:self.bottomAnchor)
        self.viewBase.leftAnchor.constraint(equalTo:self.leftAnchor).isActive = true
        self.viewBase.rightAnchor.constraint(equalTo:self.rightAnchor).isActive = true
        self.viewBase.heightAnchor.constraint(equalTo:self.heightAnchor).isActive = true
        self.viewBase.layoutTop.isActive = true
    }
    
    private func layoutBar() {
        self.viewBar.topAnchor.constraint(equalTo:self.viewBase.topAnchor,
                                          constant:ViewConstants.Scan.barTop).isActive = true
        self.viewBar.leftAnchor.constraint(equalTo:self.viewBase.leftAnchor).isActive = true
        self.viewBar.rightAnchor.constraint(equalTo:self.viewBase.rightAnchor).isActive = true
        self.viewBar.heightAnchor.constraint(equalToConstant:ViewConstants.Scan.barHeight).isActive = true
    }
}
