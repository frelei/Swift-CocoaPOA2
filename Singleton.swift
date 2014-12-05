
import UIKit

class Singleton{
    
    var number: Int = 5
    
    class var SharedInstance: Singleton{
        
        struct Static{
            static var instance: Singleton?
            static var once : dispatch_once_t = 0
        }
        
        dispatch_once(&Static.once){
            Static.instance = Singleton()
        }
        
        return Static.instance!
        
    }
    
}


let s1 = Singleton.SharedInstance
s1.number++



let s2 = Singleton.SharedInstance

