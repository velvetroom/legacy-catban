import UIKit
import Shared

public class View:Shared.View<Interactor, Presenter, UIView> {
    private weak var imageLogo:UIImageView!
    
    public override func initProperties() {
        super.initProperties()
        self.navigationbarHidden = false
    }
    
    public override func didLoad() {
        super.didLoad()
        self.configureView()
        self.makeLogo()
        self.layoutLogo()
    }
    
    private func configureView() {
        self.title = String.localized(key:"View_title", in:type(of:self))
        self.content.backgroundColor = UIColor.white
    }
    
    private func makeLogo() {
        let imageLogo:UIImageView = UIImageView()
        imageLogo.translatesAutoresizingMaskIntoConstraints = false
        imageLogo.clipsToBounds = true
        imageLogo.isUserInteractionEnabled = false
        imageLogo.contentMode = UIViewContentMode.center
        imageLogo.image = UIImage(name:Constants.assetLogo, in:type(of:self))
        self.imageLogo = imageLogo
        self.content.addSubview(imageLogo)
    }
    
    private func layoutLogo() {
        self.imageLogo.topAnchor.constraint(equalTo:self.content.safeAreaLayoutGuide.topAnchor).isActive = true
        self.imageLogo.bottomAnchor.constraint(equalTo:self.content.safeAreaLayoutGuide.bottomAnchor).isActive = true
        self.imageLogo.leftAnchor.constraint(equalTo:self.content.safeAreaLayoutGuide.leftAnchor).isActive = true
        self.imageLogo.rightAnchor.constraint(equalTo:self.content.safeAreaLayoutGuide.rightAnchor).isActive = true
    }
}
