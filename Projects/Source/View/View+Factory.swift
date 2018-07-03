import UIKit
import Shared

extension View {
    func makeToolbarItems() -> [UIBarButtonItem] {
        return [makeButtonDelete(),
                makeFixedSpace(),
                makeButtonRename(),
                makeFixedSpace(),
                makeButtonColumns()]
    }
    
    private func makeButtonDelete() -> UIBarButtonItem {
        let image:UIImage = UIImage(name:ViewConstants.Toolbar.assetDelete, in:type(of:self))
        return UIBarButtonItem(image:image, style:UIBarButtonItemStyle.plain, target:self, action:#selector(self.selectorDelete(buttonStart:)))
    }
    
    private func makeButtonRename() -> UIBarButtonItem {
        let image:UIImage = UIImage(name:ViewConstants.Toolbar.assetRename, in:type(of:self))
        return UIBarButtonItem(image:image, style:UIBarButtonItemStyle.plain, target:self, action:#selector(self.selectorRename(buttonStart:)))
    }
    
    private func makeButtonColumns() -> UIBarButtonItem {
        let image:UIImage = UIImage(name:ViewConstants.Toolbar.assetColumns, in:type(of:self))
        return UIBarButtonItem(image:image, style:UIBarButtonItemStyle.plain, target:self, action:#selector(self.selectorOpen(buttonStart:)))
    }
    
    private func makeFixedSpace() -> UIBarButtonItem {
        let space:UIBarButtonItem = UIBarButtonItem(
            barButtonSystemItem:UIBarButtonSystemItem.fixedSpace, target:nil, action:nil)
        space.width = ViewConstants.Toolbar.fixedSpace
        return space
    }
}
