import Foundation

class GitTagFactory {
    class func makeWith(string:String) -> GitTag {
        var gitTag:GitTag = GitTag()
        return gitTag
    }
    
    class func makeStringFrom(gitTag:GitTag) -> String {
        return "\(gitTag.mayor).\(gitTag.minor).\(gitTag.build)"
    }
    
    private init() { }
}
