import Foundation

struct Constants {
    struct Plist {
        static let location:String = "../Configuration/source.plist"
        static let versionKey:String = "CFBundleShortVersionString"
        static let bundleKey:String = "CFBundleVersion"
    }
    
    struct Shell {
        static let environment:String = "/usr/bin/env"
        static let encodingKey:String = "LC_ALL"
        static let encodingValue:String = "en_US.UTF-8"
        static let homeKey:String = "HOME"
        static let newLine:String = "\n"
        static let separator:Character = " "
    }
    
    struct Git {
        static let countCommits:String = "git rev-list HEAD --count"
        static let listTags:String = "git tag --sort=-refname"
    }
}
