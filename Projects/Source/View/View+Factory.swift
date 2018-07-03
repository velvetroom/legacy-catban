import UIKit
import Shared

extension View {
    func makeToolbarItems() -> [UIBarButtonItem] {
        let fixedSpace:UIBarButtonItem = self.makeFixedSpace()
        return [self.makeButtonDelete(),
                fixedSpace,
                self.makeButtonRename(),
                fixedSpace,
                self.makeButtonCloud(),
                fixedSpace,
                self.makeButtonColumns()]
    }
    
    private func makeButtonDelete() -> UIBarButtonItem {
        let image:UIImage = UIImage(name:ViewConstants.Toolbar.assetDelete, in:type(of:self))
        return UIBarButtonItem(image:image, style:UIBarButtonItemStyle.plain, target:self,
                               action:#selector(self.selectorDelete(button:)))
    }
    
    private func makeButtonRename() -> UIBarButtonItem {
        let image:UIImage = UIImage(name:ViewConstants.Toolbar.assetRename, in:type(of:self))
        return UIBarButtonItem(image:image, style:UIBarButtonItemStyle.plain, target:self,
                               action:#selector(self.selectorRename(button:)))
    }
    
    private func makeButtonCloud() -> UIBarButtonItem {
        let image:UIImage = UIImage(name:ViewConstants.Toolbar.assetCloud, in:type(of:self))
        return UIBarButtonItem(image:image, style:UIBarButtonItemStyle.plain, target:self,
                               action:#selector(self.selectorCloud(button:)))
    }
    
    private func makeButtonColumns() -> UIBarButtonItem {
        let image:UIImage = UIImage(name:ViewConstants.Toolbar.assetColumns, in:type(of:self))
        return UIBarButtonItem(image:image, style:UIBarButtonItemStyle.plain, target:self,
                               action:#selector(self.selectorOpen(button:)))
    }
    
    private func makeFixedSpace() -> UIBarButtonItem {
        let space:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.fixedSpace, target:nil,
                                                    action:nil)
        space.width = ViewConstants.Toolbar.fixedSpace
        return space
    }
}
