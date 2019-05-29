import UIKit
@IBDesignable class CustomDefaultTextField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.borderWidth = 0
        self.layer.cornerRadius = 4
        self.backgroundColor = UIColor(red: 255, green: 255, blue: 255, alpha: 0.15)
        if let placeholderString = self.placeholder {
            self.attributedPlaceholder = NSAttributedString(string: placeholderString, attributes: [
                NSAttributedString.Key.foregroundColor: UIColor.lightText.withAlphaComponent(0.25)
                ])
        }
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.layer.borderWidth = 0
        self.layer.cornerRadius = 4
        self.backgroundColor = UIColor(red: 255, green: 255, blue: 255, alpha: 0.15)
        if let placeholderString = self.placeholder {
            self.attributedPlaceholder = NSAttributedString(string: placeholderString, attributes: [
                NSAttributedString.Key.foregroundColor: UIColor.lightText.withAlphaComponent(0.25)
                ])
        }
    }
}
