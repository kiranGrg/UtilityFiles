//
//  DateFormatterStyles.swift
//  Utility
//
//  Created by Kiran Gurung on 26/6/18.
//  Copyright © 2018 Kiran Gurung. All rights reserved.
//

import Foundation

class Utility: NSObject
{
    class func validateWhiteSpace(_ str: String) -> Bool
    {
        if  str.isKind(of: NSString.self)
        {
            let trimmed: String = str.trimmingCharacters(in: CharacterSet.whitespaces)
            
            if trimmed.characters.count > 0
            {
                return true
            }
        }
        
        return false
    }
    
    class func validateEmailWithString(_ email: String) -> Bool
    {
        //Email validation
        let emailRegex: String = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest: NSPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: email)
    }
    
    class func DisplayAlertWithTitle (_ title:String ,Body:String, onViewcontriller:UIViewController)
    {
        let alertController = UIAlertController(title: title, message: Body, preferredStyle:.alert)
        
        let defaultAction = UIAlertAction(title: "Ok", style: .default, handler:nil)
        
        alertController.addAction(defaultAction)
        
        onViewcontriller.present(alertController, animated: true, completion: nil)
    }
    
    class func imageResize(_ sourceImage: UIImage, scaledToThis newSize: CGSize) -> UIImage
    {
        let newRatio: CGFloat = (sourceImage.size.width / sourceImage.size.height)
        let oldRatio: CGFloat = newSize.width / newSize.height
        let newHeight: CGFloat
        let newWidth: CGFloat
        
        if newRatio >= oldRatio
        {
            newHeight = newSize.height
            newWidth = (newSize.height * sourceImage.size.width) / (sourceImage.size.height)
        }
        else
        {
            newWidth = newSize.width
            newHeight = (newSize.width * sourceImage.size.height) / sourceImage.size.width
        }
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        sourceImage.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
        let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    class func getWidthOfstring(_ string:NSString,height: CGFloat, font: UIFont) -> CGFloat
    {
        let constraintRect = CGSize(width:9999,height:height)
        
        let boundingBox = string.boundingRect(with: constraintRect, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil)
        
        return boundingBox.width
    }
    
    class func addCornerRadious(_ object: AnyObject, redious radious: CGFloat,withcolour colour:UIColor)
    {
        let view: UIView = (object as! UIView)
        view.layer.cornerRadius = radious
        view.layer.masksToBounds = true
        view.layer.borderColor = colour.cgColor
        view.layer.borderWidth = 1
    }
    
    class func DisplayAlert(_ Title: String, Message message: String, onController controller:UIViewController)
    {
        let alert = UIAlertController(title:Title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        controller.present(alert, animated: true, completion: nil)
    }
    
    class func addLeftPaddingWithImage(_ object: UITextField, padding radious: Int, withImage strImageName: String)
    {
        let contectView = UIView(frame: CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat(radious), height: CGFloat(object.frame.size.height)))
        
        let imgView = UIImageView(frame: CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat(radious - 10), height: CGFloat(object.frame.size.height)))
        
        imgView.contentMode = .center
        imgView.image = UIImage(named: strImageName)
        object.leftViewMode = .always
        object.leftView = contectView
        
        contectView.addSubview(imgView)
        
        let lineLabel = UILabel(frame: CGRect(x: CGFloat(radious - 5), y: CGFloat(4), width: CGFloat(1), height: CGFloat(object.frame.size.height - 8)))
        lineLabel.backgroundColor = UIColor.lightGray
        
        contectView.addSubview(lineLabel)
    }
    
    class func getStringHeight(_ string: String, width: CGFloat, font usedFont: UIFont) -> CGFloat
    {
        let sizeOfString = string.boundingRect(
            with: CGSize(width: width, height: CGFloat.infinity),
            options: NSStringDrawingOptions.usesLineFragmentOrigin,
            attributes: [NSFontAttributeName: usedFont],
            context: nil).size
        
        return sizeOfString.height
    }
    
    class func addunderLine(inView textField:Any,withColour colour:UIColor)
    {
        let textField = (textField as! UIView)
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = colour.cgColor
        border.frame = CGRect(x: 0, y: textField.frame.size.height - width, width:  textField.frame.size.width, height: textField.frame.size.height)
        border.borderWidth = width
        textField.layer.addSublayer(border)
        textField.layer.masksToBounds = true
    }
    
    class func getDateFrom(_ date: Date, withFormat strFormat: String) -> String
    {
        let dateFormatter = DateFormatter()
        let posix = NSLocale(localeIdentifier: "en_US_POSIX")
        dateFormatter.locale = posix as Locale!
        dateFormatter.timeZone = NSTimeZone.system
        dateFormatter.dateFormat = strFormat
        return dateFormatter.string(from: date)
    }
    
    class func getRelativeDateAndTime(_ date: Date, withFormat strFormat: String) -> String  {
        let now = Date()
        
        let startOfWeek = now.startOfWeek!
        let yesterday = now.yesterday
        
        if (date.timeIntervalSince1970 > startOfWeek.timeIntervalSince1970) && (date.timeIntervalSince1970 < yesterday.timeIntervalSince1970) {
            return getDateFrom(date, withFormat: strFormat)
        }
        else {
            let dateFormatter = DateFormatter()
            let posix = NSLocale(localeIdentifier: "en_US_POSIX")
            dateFormatter.locale = posix as Locale!
            dateFormatter.timeZone = NSTimeZone.system
            dateFormatter.dateStyle = .long
            dateFormatter.timeStyle = .short
            dateFormatter.doesRelativeDateFormatting = true
            
            return dateFormatter.string(from: date)
        }
        
    }
    
    
    class func addLeftPadding(_ object: UITextField, padding radious: Int)
    {
        let paddingView = UIView(frame: CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat(radious), height: CGFloat(object.frame.size.height)))
        object.leftView = paddingView
        object.leftViewMode = .always
    }
    
}
