//
//  ViewController.swift
//  SwiftDemo
//
//  Created by HLH on 2017/4/10.
//  Copyright © 2017年 胡良海. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var x = 10
    var completionHandlers :[() -> Void] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        控制流()
//        集合()
//        printDemo()
//        可选值()
//        闭包()
//        下标()
//        类和结构体()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func 控制流() {
        let optionStr :String? = "option是是是"
        if let letStr = optionStr {
            print(letStr)
        }
        
        if var varStr = optionStr {
            varStr += "sdsdd"
            print(varStr)
        }
        
//        let yetAnotherPoint = (1, -1)
//        switch yetAnotherPoint {
//        case let (x, y) where x == y:
//            print("(\(x), \(y)) is on the line x == y")
//        case let (x, y) where x == -y:
//            print("(\(x), \(y)) is on the line x == -y")
//        case let (x, y):
//            print("(\(x), \(y)) is just some arbitrary point")
//        }
        
    }
    
    func 可选值() {
        let nickName :String? = nil
        let fullName :String = "John"
        let hiStr = "Hi \(nickName ?? fullName)" //处理可选值的方法是使用 ?? 运算符提供默认值。如果可选值丢失，默认值就会使用。  合并空值运算符 （ a ?? b ）如果可选项 a  有值则展开，如果没有值，是 nil  ，则返回默认值 b 。表达式 a 必须是一个可选类型。表达式 b  必须与 a  的储存类型相同
        print(hiStr)
        
        guard let name = nickName else {
            return // 分支必须转移控制结束 guard 所在的代码块。要这么做可以使用控制转移语句比如 return ， break ， continue 或者 throw ，或者它可以调用一个不带有返回值的函数或者方法，比如 fatalError() 。
        }
        print("the name is :\(name)")
    }

    
    func 集合() {
       // 数组
        let array_First = Array(repeating: 0, count: 20)// 使用0初始化
        let array_Second = Array(repeating: 0, count: 21)
        
        // 常用遍历方式
        for item in array_First {
            //todo
            print("item:\(item)")
        }
        for (index,value) in array_First.enumerated() {
            print("index:\(index) value:\(value)")
        }
        
        if array_First.elementsEqual(array_Second) {
            print("数组匹配")
        }else{
            print("数组不匹配")
        }
        
        for item in stride(from: 0, to: 60, by: 5) {
            // 使用stride可以固定跳过一些标记 输出0，5，10，15 左闭右开 不包含60
            print("stride item: \(item)")
        }
        
        for item in stride(from: 0, through: 15, by: 3) {
            print("stride through item: \(item)")
        }
        
        
        
    }
    
    func printDemo() {
        print(1...5)
        debugPrint(1...5)//相比print会输出跟多有利于调试的相关信息
        print(1,2,3,4,5, separator: "......", terminator: " &&& ")
        print("测试")
        print("sdsdssd", terminator: "  $$$$$  ")
        print("5555555")
        
    }
    
    func 打标签() {
        // 循环
        var index = 1
        whileLabel : while index < 100 {
            
            if index == 5 {
                continue whileLabel
            }
            
            if index == 10 {
                break whileLabel
            }
            index += 1
            print(index)
        }
    }
    
    func swapValue( first : inout Int , second : inout Int) {
        let sum = first + second
        first = sum - first
        second = sum - second
    }
    
    func 闭包() {
        逃逸闭包 {
            self.x = 20 // 这里必须显示使用self否则报错
        }
        completionHandlers.first?()
        print("逃逸闭包 now the x is :\(x)")
        
        非逃逸闭包(handler: { x = 30})
        print("非逃逸闭包 x is :\(x)")
        
        自动闭包(handler: x = 40) // 自动闭包就是在调用时不用加{} 对比非逃逸闭包写法
        print("自动闭包 x is :\(x)")
        
    }
    
    func 逃逸闭包(handler : @escaping () -> Void) {
        completionHandlers.append(handler)
    }
    
    func 非逃逸闭包(handler :  () -> Void) {
        handler()
    }
    
    func 自动闭包(handler : @autoclosure () -> Void) {
        handler()
    }
    
    func 类和结构体() {
//        类属性 可以使用static和class来声明但是static包含final特性在子类中不可以重写
        /*
         自动构造器的继承
         规则一：如果子类没有指定构造器，默认会继承父类的
         规则二： 如果子类是通过规则一或者重写了父类的指定构造器，会自动继承父类的所有便利构造器
         */
        class Food {
            var name = ""
            init(name:String) {
                self.name = name
            }
            
            convenience init() {
                self.init(name: "unnamed")
            }
            
            var descripe :String {
                return "the name is :\(name)"
            }
            
        }
        
        class ChinesFood :Food {
            var level = 0
            init(name :String,level :Int) {
                self.level = level
                super.init(name: name)
            }
            
//            override init(name: String) {
////                super.init(name: name)
//            }
            
        }
        
//        let fo  = ChinesFood()
//        print(fo.descripe)
        
        
    }
    
    func 下标() {
        struct CustomRect {
            var widht : Double = 0
            var height :Double = 0
            
            init(widthParam:Double,heightParam :Double) {
                widht = widthParam
                height = heightParam
            }
            
            subscript(des :String) -> Double {
                switch(des) {
                case "Area":
                    return widht * height
                    
                case "Around":
                    return 2 * (widht + height)
                    
                default:
                    return 0
                    
                }
            }
            
        }
        
        let rect : CustomRect = CustomRect.init(widthParam: 5, heightParam: 3)
        print("矩形的面积： \(rect["Area"])")
        print("矩形的周长： \(rect["Around"])")
    }
    
//    func 引用计数() {
        // weak 和 unowned： weak用于可选类型(不能保证总是有值) unowned 用于总是有值
        // 闭包的循环引用 使用捕获列表 如下：
//        class HtmlElement {
//            let name : String?
//            let text : String?
//            
//            init(name:String,text :String) {
//                self.name = name
//                self.text = text
//            }
//            
//            lazy var asHtml : () -> String = {
//                [unowned self] in
////                return "\(self.name)"
//                
//            }
//            
//        }
//    }
    func 错误处理(filename :String)  throws {
        // 使用defer 可以指定清理操作 使用 defer语句来在代码离开当前代码块前执行语句合集。
    }
    
    func 类型转换() {
        // 使用类型检查操作符 （ is ）来检查一个实例是否属于一个特定的子类。
        //- AnyObject  可以表示任何类类型的实例。
        //- Any  可以表示任何类型，包括函数类型。
    }
    
}

