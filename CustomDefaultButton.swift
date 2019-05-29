import UIKit
@IBDesignable class CustomDefaultButton: UIButton {
    convenience init(borderWidth:CGFloat, borderColor:UIColor, cornerRadius:CGFloat, frame:CGRect) {
        self.init(frame: frame)
        self.borderWidth = borderWidth
        self.radius = cornerRadius
        self.borderColor = borderColor
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.borderWidth = 0
        self.radius = 4
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.borderWidth = 0
        self.radius = 4
        self.titleLabel?.numberOfLines = 1
        self.titleLabel?.adjustsFontSizeToFitWidth = true
        self.titleLabel?.minimumScaleFactor = 0.5
    }
    @IBInspectable var borderColor: UIColor {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue.cgColor
        }
    }
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    @IBInspectable var radius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    @IBInspectable var buttonBackgroundColor: UIColor {
        get {
            return UIColor(cgColor: layer.backgroundColor!)
        }
        set {
            layer.backgroundColor = newValue.cgColor
        }
    }
}
