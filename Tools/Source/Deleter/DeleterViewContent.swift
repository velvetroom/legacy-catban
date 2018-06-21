import UIKit

class DeleterViewContent:UIView {
    weak var background:DeleterViewBackground!
    weak var viewMenu:DeleterViewMenu!
    
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
    }
    
    private func makeOutlets() {
        self.makeBackground()
        self.makeMenu()
    }
    
    private func layoutOutlets() {
        self.layoutBackground()
        self.layoutMenu()
    }
    
    private func makeBackground() {
        let background:DeleterViewBackground = DeleterViewBackground()
        self.background = background
        self.addSubview(background)
    }
    
    private func makeMenu() {
        let viewMenu:DeleterViewMenu = DeleterViewMenu()
        self.viewMenu = viewMenu
        self.addSubview(viewMenu)
    }
    
    private func layoutBackground() {
        self.background.topAnchor.constraint(equalTo:self.topAnchor).isActive = true
        self.background.bottomAnchor.constraint(equalTo:self.bottomAnchor).isActive = true
        self.background.leftAnchor.constraint(equalTo:self.leftAnchor).isActive = true
        self.background.rightAnchor.constraint(equalTo:self.rightAnchor).isActive = true
    }
    
    private func layoutMenu() {
        self.viewMenu.layoutBottom = self.viewMenu.bottomAnchor.constraint(
            equalTo:self.bottomAnchor, constant:DeleterConstats.Menu.height)
        self.viewMenu.layoutBottom.isActive = true
        self.viewMenu.heightAnchor.constraint(equalToConstant:DeleterConstats.Menu.height).isActive = true
        self.viewMenu.leftAnchor.constraint(equalTo:self.leftAnchor).isActive = true
        self.viewMenu.rightAnchor.constraint(equalTo:self.rightAnchor).isActive = true
    }
}
