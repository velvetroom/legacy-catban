import UIKit
import Shared

public class Spinner:UIImageView {
    class func loadImages() -> [UIImage] {
        var images:[UIImage] = []
        for index:Int in 0 ..< SpinnerConstants.images {
            images.append(UIImage(name:SpinnerConstants.prefix + String(index), in:Spinner.self))
        }
        return images
    }
    
    public init() {
        super.init(frame:CGRect.zero)
        self.configureView()
    }
    
    public required init?(coder:NSCoder) {
        return nil
    }
    
    private func configureView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.isUserInteractionEnabled = false
        self.clipsToBounds = true
        self.contentMode = UIViewContentMode.center
        self.animationImages = Spinner.loadImages()
        self.animationDuration = SpinnerConstants.animationDuration
    }
}
