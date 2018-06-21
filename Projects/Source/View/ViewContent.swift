import UIKit

public class ViewContent:UIView {
    weak var viewList:ViewList!
    weak var viewEmpty:ViewEmpty!
    weak var viewSelector:ViewSelector!
    
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
        self.makeSelector()
        self.makeList()
        self.makeEmpty()
    }
    
    private func layoutOutlets() {
        self.layoutSelector()
        self.layoutList()
        self.layoutEmpty()
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
        self.addSubview(viewSelector)
        self.viewSelector = viewSelector
    }
    
    private func layoutList() {
        self.layoutAdjustEqual(view:self.viewList)
    }
    
    private func layoutEmpty() {
        self.layoutAdjustEqual(view:self.viewEmpty)
    }
    
    private func layoutSelector() {
        self.viewSelector.layoutY = self.viewSelector.centerYAnchor.constraint(
            equalTo:self.safeAreaLayoutGuide.topAnchor)
        self.viewSelector.layoutY.isActive = true
        self.viewSelector.leftAnchor.constraint(equalTo:self.safeAreaLayoutGuide.leftAnchor).isActive = true
        self.viewSelector.rightAnchor.constraint(equalTo:self.safeAreaLayoutGuide.rightAnchor).isActive = true
        self.viewSelector.heightAnchor.constraint(equalToConstant:ViewConstants.Selector.height).isActive = true
    }
    
    private func layoutAdjustEqual(view:UIView) {
        view.topAnchor.constraint(equalTo:self.safeAreaLayoutGuide.topAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo:self.safeAreaLayoutGuide.bottomAnchor).isActive = true
        view.leftAnchor.constraint(equalTo:self.safeAreaLayoutGuide.leftAnchor).isActive = true
        view.rightAnchor.constraint(equalTo:self.safeAreaLayoutGuide.rightAnchor).isActive = true
    }
}
