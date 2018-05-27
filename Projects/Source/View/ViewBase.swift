import UIKit
import Shared

class ViewBase:UIView {
    weak var viewBar:ViewBar!
    weak var viewList:ViewList!
    weak var viewMenu:ViewMenu!
    weak var viewEmpty:ViewEmpty!
    weak var buttonAdd:UIButton!
    
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
        self.factoryEmpty()
        self.factoryAdd()
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
    
    private func factoryEmpty() {
        let viewEmpty:ViewEmpty = ViewEmpty()
        self.viewEmpty = viewEmpty
        self.addSubview(viewEmpty)
        
        viewEmpty.topAnchor.constraint(equalTo:self.viewList.topAnchor).isActive = true
        viewEmpty.bottomAnchor.constraint(equalTo:self.viewList.bottomAnchor).isActive = true
        viewEmpty.leftAnchor.constraint(equalTo:self.viewList.leftAnchor).isActive = true
        viewEmpty.rightAnchor.constraint(equalTo:self.viewList.rightAnchor).isActive = true
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
    
    private func factoryAdd() {
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
}
