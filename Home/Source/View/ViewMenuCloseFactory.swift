import UIKit
import Shared

class ViewMenuCloseFactory {
    class func makeOpenAnimation() -> [UIImage] {
        var icons:[UIImage] = []
        for index:Int in 0 ..< ViewConstants.Close.totalImages {
            icons.append(loadImageWith(index:index))
        }
        return icons
    }
    
    class func makeCloseAnimation() -> [UIImage] {
        return makeOpenAnimation().reversed()
    }
    
    private class func loadImageWith(index:Int) -> UIImage {
        var iconName:String = ViewConstants.Close.icons
        if index < 10 {
            iconName += "0"
        }
        iconName += String(index)
        return UIImage(name:iconName, in:self)
    }
}
