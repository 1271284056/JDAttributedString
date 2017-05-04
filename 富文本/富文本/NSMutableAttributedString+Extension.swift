//
//  NSMutableAttributedString+Extension.swift
//  富文本
//
//  Created by 张江东 on 2017/5/4.
//  Copyright © 2017年 58kuaipai. All rights reserved.
//

import UIKit


extension NSMutableAttributedString {
    
    //MARK: 选中字体颜色变红
    /// - Parameters:
    ///   - text: 所有字符串
    ///   - selectedText: 需要变颜色的字符串
    ///   - allColor: 字符串本来颜色
    ///   - selectedColor: 选中字符串颜色
    ///   - fone: 字符串字体大小
    /// - Returns: 返回一个NSMutableAttributedString
    static func attributenStringColor(text:String,
                                 selectedText: String,
                                 allColor: UIColor,
                                 selectedColor: UIColor,
                                 fone: CGFloat)->NSMutableAttributedString{
        var rangeArray: [NSRange] = [NSRange]()
        var lastLength: Int = 0
        let attStr = NSMutableAttributedString.init(string: text, attributes: [NSFontAttributeName : UIFont.systemFont(ofSize: fone),NSForegroundColorAttributeName:allColor])
        var text = text as NSString
        
        while text.contains(selectedText) {
            let rang: NSRange =  text.range(of: selectedText)
            let rang2 = NSMakeRange(rang.location + lastLength, rang.length)
            rangeArray.append(rang2)
            lastLength += (rang.length + rang.location )
            text = text.substring(from: rang.length + rang.location) as NSString
        }
        
        for range1 in rangeArray {
            attStr.setAttributes([NSForegroundColorAttributeName:selectedColor], range: range1)
        }
        
        return attStr
    }
    
    
    //MARK: 指定两个字符中间文字变色
    ///
    /// - Parameters:
    ///   - text: 所有字符串
    ///   - allColor: 基础颜色
    ///   - selectedColor: 特殊颜色
    ///   - firstStr: 其实字符串
    ///   - lastStr: 结束字符串
    ///   - fone: 基础字体
    /// - Returns: NSMutableAttributedString
    static func attributenStringMutColor(text:String,
                                 allColor: UIColor,
                                 selectedColor: UIColor,
                                 firstStr : String,
                                 lastStr : String,
                                 fone: CGFloat)->NSMutableAttributedString{
        
        var rangeArray: [NSRange] = [NSRange]()
        var lastLength: Int = 0
        let attStr = NSMutableAttributedString.init(string: text, attributes: [NSFontAttributeName : UIFont.systemFont(ofSize: fone),NSForegroundColorAttributeName:allColor])
        var text = text as NSString
        
        while text.contains(firstStr) {
            let rang1: NSRange =  text.range(of: firstStr)
            let range2: NSRange =  text.range(of: lastStr)
            let orangeRange = NSMakeRange(rang1.location + 1, range2.location - (rang1.location + 1))
            let range = NSMakeRange(rang1.location + 1 + lastLength , range2.location - (rang1.location + 1) )
            rangeArray.append(range)
            lastLength += (orangeRange.length + orangeRange.location + 1)
            text = text.substring(from: orangeRange.length + orangeRange.location + 1) as NSString
        }
        
        for range1 in rangeArray {
            attStr.setAttributes([NSForegroundColorAttributeName:UIColor.red], range: range1)
        }
        
        return attStr
    }
    
    
    //MARK: 行间距
    ///
    /// - Parameters:
    ///   - text: 整体字符串
    ///   - lineSpace: 行间距
    ///   - fone: 字图
    /// - Returns: NSMutableAttributedString
    static func lineSpace(text: String,lineSpace: CGFloat,fone: CGFloat)->NSMutableAttributedString{
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpace
        let attStr = NSMutableAttributedString.init(string: text, attributes: [NSFontAttributeName : UIFont.systemFont(ofSize: fone)])
        attStr.addAttributes([NSParagraphStyleAttributeName : paragraphStyle], range: NSMakeRange(0, text.characters.count))
        
        return attStr
    }
    
    
    /// 可变字体
    ///
    /// - Parameters:
    ///   - text: 整体字符串
    ///   - selectedText: 选中字符串
    ///   - allFont: 基础字体
    ///   - selectedFont: 变化字体
    ///   - textColor: 字符串颜色
    /// - Returns: NSMutableAttributedString
    static func attributenStringFont(text:String,
                                      selectedText: String,
                                      allFont: CGFloat,
                                      selectedFont: CGFloat,
                                      textColor: UIColor)->NSMutableAttributedString{
        var rangeArray: [NSRange] = [NSRange]()
        var lastLength: Int = 0
        let attStr = NSMutableAttributedString.init(string: text, attributes: [NSFontAttributeName : UIFont.systemFont(ofSize: allFont),NSForegroundColorAttributeName:textColor])
        var text = text as NSString
        
        while text.contains(selectedText) {
            let rang: NSRange =  text.range(of: selectedText)
            let rang2 = NSMakeRange(rang.location + lastLength, rang.length)
            rangeArray.append(rang2)
            lastLength += (rang.length + rang.location )
            text = text.substring(from: rang.length + rang.location) as NSString
        }

        for range1 in rangeArray {
            //NSForegroundColorAttributeName:UIColor.red 去掉后就没特殊颜色了
            attStr.setAttributes([NSFontAttributeName : UIFont.systemFont(ofSize: selectedFont),NSForegroundColorAttributeName:UIColor.red], range: range1)
        }
    
        return attStr
    }
    
    
    


}
