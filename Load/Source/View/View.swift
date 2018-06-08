import UIKit
import Shared

class View:Shared.View {
    weak var imageLogo:UIImageView!
    
    override func didLoad() {
        super.didLoad()
        self.configureView()
        self.makeLogo()
        self.layoutLogo()
    }
    
    private func configureView() {
        self.title = String.localized(key:"View_title", in:type(of:self))
        self.view.backgroundColor = UIColor.white
    }
    
    private func makeLogo() {
        let imageLogo:UIImageView = UIImageView()
        imageLogo.translatesAutoresizingMaskIntoConstraints = false
        imageLogo.clipsToBounds = true
        imageLogo.isUserInteractionEnabled = false
        imageLogo.contentMode = UIViewContentMode.center
        imageLogo.image = UIImage(name:ViewConstants.assetLogo, in:type(of:self))
        self.imageLogo = imageLogo
        self.view.addSubview(imageLogo)
    }
    
    private func layoutLogo() {
        imageLogo.topAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        imageLogo.bottomAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        imageLogo.leftAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.leftAnchor).isActive = true
        imageLogo.rightAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.rightAnchor).isActive = true
    }
}
