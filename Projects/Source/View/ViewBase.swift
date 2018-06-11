import UIKit

public class ViewBase:UIView {
    weak var viewList:ViewList!
    weak var viewEmpty:ViewEmpty!
    
    init() {
        super.init(frame:CGRect.zero)
        self.configureView()
        self.makeOutlets()
        self.layoutOutlets()
    }
    
    public required init?(coder:NSCoder) {
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
    }
    
    private func layoutOutlets() {
        self.layoutList()
        self.layoutEmpty()
        self.layoutSelector()
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
        self.viewList.addSubview(viewSelector)
        self.viewList.viewSelector = viewSelector
    }
    
    private func layoutList() {
        self.layoutAdjustEqual(view:self.viewList)
    }
    
    private func layoutEmpty() {
        self.layoutAdjustEqual(view:self.viewEmpty)
    }
    
    private func layoutSelector() {
        self.viewList.viewSelector.layoutY = self.viewList.viewSelector.centerYAnchor.constraint(
            equalTo:self.safeAreaLayoutGuide.topAnchor)
        self.viewList.viewSelector.layoutY.isActive = true
        self.viewList.viewSelector.leftAnchor.constraint(
            equalTo:self.safeAreaLayoutGuide.leftAnchor).isActive = true
        self.viewList.viewSelector.rightAnchor.constraint(
            equalTo:self.safeAreaLayoutGuide.rightAnchor).isActive = true
        self.viewList.viewSelector.heightAnchor.constraint(
            equalToConstant:ViewConstants.Selector.height).isActive = true
    }
    
    private func layoutAdjustEqual(view:UIView) {
        view.topAnchor.constraint(equalTo:self.safeAreaLayoutGuide.topAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo:self.safeAreaLayoutGuide.bottomAnchor).isActive = true
        view.leftAnchor.constraint(equalTo:self.safeAreaLayoutGuide.leftAnchor).isActive = true
        view.rightAnchor.constraint(equalTo:self.safeAreaLayoutGuide.rightAnchor).isActive = true
    }
}
