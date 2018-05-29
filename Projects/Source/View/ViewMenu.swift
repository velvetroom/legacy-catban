import UIKit

class ViewMenu:UIView {
    weak var buttonDelete:ViewMenuItem!
    weak var buttonRename:ViewMenuItem!
    weak var buttonOpen:ViewMenuItem!
    
    init() {
        super.init(frame:CGRect.zero)
        self.configureView()
        self.factoryViews()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    private func configureView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.clipsToBounds = true
    }
    
    private func factoryViews() {
        self.factoryBorder()
        self.factoryDelete()
        self.factoryRename()
        self.factoryOpen()
    }
    
    private func factoryBorder() {
        let border:UIView = UIView()
        border.isUserInteractionEnabled = false
        border.translatesAutoresizingMaskIntoConstraints = false
        border.backgroundColor = UIColor(white:0, alpha:0.2)
        self.addSubview(border)
        
        border.topAnchor.constraint(equalTo:self.topAnchor).isActive = true
        border.leftAnchor.constraint(
            equalTo:self.leftAnchor, constant:ViewConstants.Menu.borderMargin).isActive = true
        border.rightAnchor.constraint(
            equalTo:self.rightAnchor, constant:-ViewConstants.Menu.borderMargin).isActive = true
        border.heightAnchor.constraint(equalToConstant:ViewConstants.Menu.borderWidth).isActive = true
    }
    
    private func factoryDelete() {
        let buttonDelete:ViewMenuItem = ViewMenuItem()
        buttonDelete.addImage(name:ViewConstants.MenuItem.iconDelete)
        self.buttonDelete = buttonDelete
        self.addSubview(buttonDelete)
        
        buttonDelete.topAnchor.constraint(
            equalTo:self.topAnchor, constant:ViewConstants.Menu.itemMargin).isActive = true
        buttonDelete.leftAnchor.constraint(
            equalTo:self.leftAnchor, constant:ViewConstants.Menu.itemMargin * 2).isActive = true
        buttonDelete.widthAnchor.constraint(equalToConstant:ViewConstants.MenuItem.size).isActive = true
        buttonDelete.heightAnchor.constraint(equalToConstant:ViewConstants.MenuItem.size).isActive = true
    }
    
    private func factoryRename() {
        let buttonRename:ViewMenuItem = ViewMenuItem()
        buttonRename.addImage(name:ViewConstants.MenuItem.iconRename)
        self.buttonRename = buttonRename
        self.addSubview(buttonRename)
        
        buttonRename.topAnchor.constraint(
            equalTo:self.topAnchor, constant:ViewConstants.Menu.itemMargin).isActive = true
        buttonRename.leftAnchor.constraint(
            equalTo:self.buttonDelete.rightAnchor, constant:ViewConstants.Menu.itemMargin).isActive = true
        buttonRename.widthAnchor.constraint(equalToConstant:ViewConstants.MenuItem.size).isActive = true
        buttonRename.heightAnchor.constraint(equalToConstant:ViewConstants.MenuItem.size).isActive = true
    }
    
    private func factoryOpen() {
        let buttonOpen:ViewMenuItem = ViewMenuItem()
        buttonOpen.addImage(name:ViewConstants.MenuItem.iconOpen)
        self.buttonOpen = buttonOpen
        self.addSubview(buttonOpen)
        
        buttonOpen.topAnchor.constraint(
            equalTo:self.topAnchor, constant:ViewConstants.Menu.itemMargin).isActive = true
        buttonOpen.leftAnchor.constraint(
            equalTo:self.buttonRename.rightAnchor, constant:ViewConstants.Menu.itemMargin).isActive = true
        buttonOpen.widthAnchor.constraint(equalToConstant:ViewConstants.MenuItem.size).isActive = true
        buttonOpen.heightAnchor.constraint(equalToConstant:ViewConstants.MenuItem.size).isActive = true
    }
}
