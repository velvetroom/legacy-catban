import UIKit

class ViewBase:UIView {
    private(set) weak var viewBar:ViewBar!
    private(set) weak var viewList:ViewList!
    private(set) weak var viewMenu:ViewMenu!
    
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
        self.factoryBar()
        self.factoryMenu()
        self.factoryList()
    }
    
    private func factoryBar() {
        let viewBar:ViewBar = ViewBar()
        self.viewBar = viewBar
        self.addSubview(viewBar)
        
        viewBar.topAnchor.constraint(equalTo:self.safeAreaLayoutGuide.topAnchor).isActive = true
        viewBar.leftAnchor.constraint(equalTo:self.safeAreaLayoutGuide.leftAnchor).isActive = true
        viewBar.rightAnchor.constraint(equalTo:self.safeAreaLayoutGuide.rightAnchor).isActive = true
        viewBar.heightAnchor.constraint(equalToConstant:ViewConstants.Bar.height).isActive = true
    }
    
    private func factoryList() {
        let viewList:ViewList = ViewList()
        self.viewList = viewList
        self.addSubview(viewList)
        
        viewList.topAnchor.constraint(equalTo:self.viewBar.bottomAnchor).isActive = true
        viewList.bottomAnchor.constraint(equalTo:self.viewMenu.topAnchor).isActive = true
        viewList.leftAnchor.constraint(equalTo:self.leftAnchor).isActive = true
        viewList.rightAnchor.constraint(equalTo:self.rightAnchor).isActive = true
    }
    
    private func factoryMenu() {
        let viewMenu:ViewMenu = ViewMenu()
        self.viewMenu = viewMenu
        self.addSubview(viewMenu)
        
        viewMenu.bottomAnchor.constraint(equalTo:self.safeAreaLayoutGuide.bottomAnchor).isActive = true
        viewMenu.leftAnchor.constraint(equalTo:self.safeAreaLayoutGuide.leftAnchor).isActive = true
        viewMenu.rightAnchor.constraint(equalTo:self.safeAreaLayoutGuide.rightAnchor).isActive = true
        viewMenu.heightAnchor.constraint(equalToConstant:ViewConstants.Menu.height).isActive = true
    }
}
