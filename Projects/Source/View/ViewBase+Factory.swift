import UIKit

extension ViewBase {
    func factoryBar() {
        let viewBar:ViewBar = ViewBar()
        self.viewBar = viewBar
        self.addSubview(viewBar)
        
        viewBar.topAnchor.constraint(equalTo:self.safeAreaLayoutGuide.topAnchor).isActive = true
        viewBar.leftAnchor.constraint(equalTo:self.safeAreaLayoutGuide.leftAnchor).isActive = true
        viewBar.rightAnchor.constraint(equalTo:self.safeAreaLayoutGuide.rightAnchor).isActive = true
        viewBar.heightAnchor.constraint(equalToConstant:ViewConstants.Bar.height).isActive = true
    }
    
    func factoryList() {
        let viewList:ViewList = ViewList()
        self.viewList = viewList
        self.addSubview(viewList)
        
        viewList.topAnchor.constraint(equalTo:self.viewBar.bottomAnchor).isActive = true
        viewList.bottomAnchor.constraint(equalTo:self.viewMenu.topAnchor).isActive = true
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
    
    func factoryAdd() {
        let iconOff:UIImage = UIImage(name:ViewConstants.Add.imageOff, in:type(of:self))
        let iconOn:UIImage = UIImage(name:ViewConstants.Add.imageOn, in:type(of:self))
        let buttonAdd:UIButton = UIButton()
        buttonAdd.translatesAutoresizingMaskIntoConstraints = false
        buttonAdd.setImage(iconOff, for:UIControlState.normal)
        buttonAdd.setImage(iconOn, for:UIControlState.highlighted)
        buttonAdd.imageView!.clipsToBounds = true
        buttonAdd.imageView!.contentMode = UIViewContentMode.center
        self.buttonAdd = buttonAdd
        self.addSubview(buttonAdd)
        
        buttonAdd.centerYAnchor.constraint(equalTo:self.viewBar.bottomAnchor).isActive = true
        buttonAdd.centerXAnchor.constraint(equalTo:self.centerXAnchor).isActive = true
        buttonAdd.widthAnchor.constraint(equalToConstant:ViewConstants.Add.size).isActive = true
        buttonAdd.heightAnchor.constraint(equalToConstant:ViewConstants.Add.size).isActive = true
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
