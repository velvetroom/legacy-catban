import UIKit

extension LandingController {
    private var rightBarButtonItems:[UIBarButtonItem] {
        get {
            return [UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.organize, target:self,
                                    action:#selector(self.selectorOrganise(sender:))),
                    UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.compose, target:self,
                                    action:#selector(self.selectorEditProject(sender:))),
                    UIBarButtonItem(title:"Stats", style:UIBarButtonItemStyle.plain, target:self,
                                    action:#selector(self.selectorOrganise(sender:))),
                    UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.add, target:self,
                                    action:#selector(self.selectorAdd(sender:)))]
        }
    }
    
    func adjustNavigationItem() {
        self.navigationItem.largeTitleDisplayMode = UINavigationItem.LargeTitleDisplayMode.always
        self.navigationItem.rightBarButtonItems = self.rightBarButtonItems
        self.title = String.localizedLanding(key:"LandingController_title")
    }
}
