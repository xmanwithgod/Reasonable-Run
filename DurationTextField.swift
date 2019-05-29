import UIKit
class DurationTextField: CustomDefaultTextField {
    var previousTranslationPoint = CGFloat()
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
