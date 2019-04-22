//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

/*
 for i in 1...10 {
 print(Int(arc4random()) % 100000)
 }*/

var originArr = [13154,
                 23420,
                 9919,
                 29405,
                 94593,
                 43198,
                 20323,
                 40863,
                 79162,
                 52840,]

var strArr = ["B","A","C","Y"]
var v1 = UIView()
v1.tag = 30
var v2 = UIView()
v2.tag = 100
var v3 = UIView()
v3.tag = 500
var viewArr = [v1, v2, v3]



func switchValue<T>(_ arr:inout [T], left:Int,right:Int) {
    let temp = arr[left]
    arr[left] = arr[right]
    arr[right] = temp
}

func sort<T>(_ arr:inout [T], left:Int, right:Int, compare:(T,T) -> Bool) {
    if right <= left {
        return
    }
    
    let key = arr[left]
    var i = left + 1
    var j = right
    while true {
        while compare(arr[i],key) {
            i += 1
            if i == right {
                break
            }
            
        }
        
        while compare(key,arr[j]) {
            j -= 1
            if j == left {
                break
            }
            
        }
        
        if i >= j {
            break
        }
        
        switchValue(&arr,left: i, right: j)
    }
    switchValue(&arr,left: left, right: j)
    sort(&arr,left: left, right: j - 1, compare: compare)
    sort(&arr,left: j + 1, right: right, compare: compare)
}

sort(&originArr,left: 0, right: originArr.count - 1) { (left, right) -> Bool in
    left < right
}

print(originArr)

sort(&strArr, left: 0, right: strArr.count - 1) { (left, right) -> Bool in
    left < right
}

print(strArr)

sort(&viewArr, left: 0, right: viewArr.count - 1) { (left, right) -> Bool in
    left.hashValue < right.hashValue
}
print(viewArr)
print(viewArr[0].tag)
print(viewArr[1].tag)
print(viewArr[2].tag)





