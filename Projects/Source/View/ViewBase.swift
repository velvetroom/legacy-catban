import UIKit

class ViewBase:UIView {
    weak var viewList:ViewList!
    weak var viewSelector:ViewSelector!
    weak var viewEmpty:ViewEmpty!
    weak var viewRenamer:ViewRenamer!
    
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
        self.clipsToBounds = true
        self.backgroundColor = UIColor.white
    }
    
    private func makeOutlets() {
        self.makeList()
        self.makeEmpty()
        self.makeSelector()
        self.makeRenamer()
    }
    
    private func layoutOutlets() {
        self.layoutList()
        self.layoutEmpty()
        self.layoutSelector()
        self.layoutRenamer()
    }
    
    private func makeList() {
        let viewList:ViewList = ViewList()
        self.viewList = viewList
        self.addSubview(viewList)
    }
    
    private func makeEmpty() {
        let viewEmpty:ViewEmpty = ViewEmpty()
        self.viewEmpty = viewEmpty
        self.addSubview(viewEmpty)
    }
    
    private func makeSelector() {
        let viewSelector:ViewSelector = ViewSelector()
        self.viewSelector = viewSelector
        self.viewList.insertSubview(viewSelector, at:0)
    }
    
    private func makeRenamer() {
        let viewRenamer:ViewRenamer = ViewRenamer()
        self.viewRenamer = viewRenamer
        self.addSubview(viewRenamer)
    }
    
    private func layoutList() {
        self.layoutAdjustEqual(view:self.viewList)
    }
    
    private func layoutEmpty() {
        self.layoutAdjustEqual(view:self.viewEmpty)
    }
    
    private func layoutSelector() {
        self.viewList.layoutSelectorY = viewSelector.centerYAnchor.constraint(
            equalTo:self.safeAreaLayoutGuide.topAnchor)
        self.viewList.layoutSelectorY.isActive = true
        self.viewSelector.leftAnchor.constraint(equalTo:self.safeAreaLayoutGuide.leftAnchor).isActive = true
        self.viewSelector.rightAnchor.constraint(equalTo:self.safeAreaLayoutGuide.rightAnchor).isActive = true
        self.viewSelector.heightAnchor.constraint(equalToConstant:ViewConstants.Selector.height).isActive = true
    }
    
    private func layoutRenamer() {
        self.layoutAdjustEqual(view:self.viewRenamer)
    }
    
    private func layoutAdjustEqual(view:UIView) {
        view.topAnchor.constraint(equalTo:self.safeAreaLayoutGuide.topAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo:self.safeAreaLayoutGuide.bottomAnchor).isActive = true
        view.leftAnchor.constraint(equalTo:self.safeAreaLayoutGuide.leftAnchor).isActive = true
        view.rightAnchor.constraint(equalTo:self.safeAreaLayoutGuide.rightAnchor).isActive = true
    }
}
