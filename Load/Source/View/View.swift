import UIKit
import Shared

class View:Shared.View {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
        self.addLogo()
    }
    
    private func configureView() {
        self.title = String.localized(key:"View_title", in:type(of:self))
        self.view.backgroundColor = UIColor.white
    }
    
    private func addLogo() {
        let imageLogo:UIImageView = UIImageView()
        imageLogo.translatesAutoresizingMaskIntoConstraints = false
        imageLogo.clipsToBounds = true
        imageLogo.isUserInteractionEnabled = false
        imageLogo.contentMode = UIViewContentMode.center
        imageLogo.image = UIImage(name:ViewConstants.assetLogo, in:type(of:self))
        
        self.view.addSubview(imageLogo)
        
        imageLogo.topAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        imageLogo.bottomAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        imageLogo.leftAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.leftAnchor).isActive = true
        imageLogo.rightAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.rightAnchor).isActive = true
    }
}
