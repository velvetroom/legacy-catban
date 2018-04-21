import UIKit

extension LandingController {
    private var rightBarButtonItems:[UIBarButtonItem] {
        get {
            return [UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.organize, target:self,
                                    action:#selector(self.selectorOrganise(sender:))),
                    UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.compose, target:self,
                                    action:#selector(self.selectorOrganise(sender:))),
                    UIBarButtonItem(title:"Stats", style:UIBarButtonItemStyle.plain, target:self,
                                    action:#selector(self.selectorOrganise(sender:))),
                    UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.add, target:self,
                                    action:#selector(self.selectorAdd(sender:)))]
        }
    }
    
    private var leftBarButtonItems:[UIBarButtonItem] {
        get {
            return []
        }
    }
    
    func adjustNavigationItem() {
        self.navigationItem.largeTitleDisplayMode = UINavigationItem.LargeTitleDisplayMode.always
        self.navigationItem.rightBarButtonItems = self.rightBarButtonItems
        self.navigationItem.leftBarButtonItems = self.leftBarButtonItems
        self.title = String.localizedLanding(key:"LandingController_title")
    }
}
