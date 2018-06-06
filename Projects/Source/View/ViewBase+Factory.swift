import UIKit

extension ViewBase {
    func factoryList() {
        let viewList:ViewList = ViewList()
        self.viewList = viewList
        self.addSubview(viewList)
        
        viewList.topAnchor.constraint(equalTo:self.topAnchor).isActive = true
        viewList.bottomAnchor.constraint(equalTo:self.bottomAnchor).isActive = true
        viewList.leftAnchor.constraint(equalTo:self.leftAnchor).isActive = true
        viewList.rightAnchor.constraint(equalTo:self.rightAnchor).isActive = true
    }
    
    func factoryEmpty() {
        let viewEmpty:ViewEmpty = ViewEmpty()
        self.viewEmpty = viewEmpty
        self.addSubview(viewEmpty)
        
        viewEmpty.topAnchor.constraint(equalTo:self.viewList.topAnchor).isActive = true
        viewEmpty.bottomAnchor.constraint(equalTo:self.viewList.bottomAnchor).isActive = true
        viewEmpty.leftAnchor.constraint(equalTo:self.viewList.leftAnchor).isActive = true
        viewEmpty.rightAnchor.constraint(equalTo:self.viewList.rightAnchor).isActive = true
    }
    
    func factoryMenu() {
        let viewMenu:ViewMenu = ViewMenu()
        self.viewMenu = viewMenu
        self.addSubview(viewMenu)
        
        viewMenu.bottomAnchor.constraint(equalTo:self.safeAreaLayoutGuide.bottomAnchor).isActive = true
        viewMenu.leftAnchor.constraint(equalTo:self.safeAreaLayoutGuide.leftAnchor).isActive = true
        viewMenu.rightAnchor.constraint(equalTo:self.safeAreaLayoutGuide.rightAnchor).isActive = true
        viewMenu.heightAnchor.constraint(equalToConstant:ViewConstants.Menu.height).isActive = true
    }
    
    func factorySelector() {
        let viewSelector:ViewListSelector = ViewListSelector()
        self.viewSelector = viewSelector
        self.insertSubview(viewSelector, belowSubview:self.viewList)
        
        self.viewList.layoutSelectorY = viewSelector.centerYAnchor.constraint(equalTo:self.viewList.topAnchor)
        self.viewList.layoutSelectorY.isActive = true
        viewSelector.leftAnchor.constraint(equalTo:self.leftAnchor).isActive = true
        viewSelector.rightAnchor.constraint(equalTo:self.rightAnchor).isActive = true
        viewSelector.heightAnchor.constraint(equalToConstant:ViewConstants.ListSelector.height).isActive = true
    }
    
    func factoryRenamer() {
        let viewRename:ViewRenamer = ViewRenamer()
        self.viewRenamer = viewRename
        self.addSubview(viewRename)
        
        viewRename.topAnchor.constraint(equalTo:self.topAnchor).isActive = true
        viewRename.bottomAnchor.constraint(equalTo:self.bottomAnchor).isActive = true
        viewRename.leftAnchor.constraint(equalTo:self.leftAnchor).isActive = true
        viewRename.rightAnchor.constraint(equalTo:self.rightAnchor).isActive = true
    }
}
