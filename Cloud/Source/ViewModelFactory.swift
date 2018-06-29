import UIKit
import Architecture
import Board
import Shared

class ViewModelFactory {
    class func makeContentWith(project:ProjectProtocol) -> ViewModelContent {
        if let project:ProjectSynchedProtocol = project as? ProjectSynchedProtocol {
            return makeSynchedContentWith(project:project)
        } else {
            return makeNotClouded()
        }
    }
    
    class func makeProjectWith(project:ProjectProtocol) -> ViewModelProject {
        var property:ViewModelProject = ViewModelProject()
        property.projectName = project.name
        return property
    }
    
    class func makeNavigationWith(project:ProjectProtocol) -> ViewModelNavigation {
        var property:ViewModelNavigation = ViewModelNavigation()
        property.navigationbarHidden = !(project is ProjectSynchedProtocol)
        return property
    }
    
    private class func makeSynchedContentWith(project:ProjectSynchedProtocol) -> ViewModelContent {
        if project.needsSync {
            return makeCloud()
        } else {
            return makeUpToDate()
        }
    }
    
    private class func makeNotClouded() -> ViewModelContent {
        var property:ViewModelContent = ViewModelContent()
        property.actionHidden = true
        property.message = String.localized(key:"ViewNotClouded_LabelNotClouded", in:View.self)
        property.icon = UIImage(name:ViewConstants.Icon.assetNotClouded, in:Cloud.View.self)
        return property
    }
    
    private class func makeCloud() -> ViewModelContent {
        var property:ViewModelContent = ViewModelContent()
        property.actionHidden = false
        property.message = String.localized(key:"ViewNotClouded_LabelCloud", in:Cloud.View.self)
        property.icon = UIImage(name:ViewConstants.Icon.assetCloud, in:Cloud.View.self)
        return property
    }
    
    private class func makeUpToDate() -> ViewModelContent {
        var property:ViewModelContent = ViewModelContent()
        property.actionHidden = true
        property.message = String.localized(key:"ViewNotClouded_LabelUpToDate", in:Cloud.View.self)
        property.icon = UIImage(name:ViewConstants.Icon.assetUpToDate, in:Cloud.View.self)
        return property
    }
    
    private init() { }
}
