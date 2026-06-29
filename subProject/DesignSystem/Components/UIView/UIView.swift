
import UIKit

@IBDesignable
public class DesignableGradientView: UIView {

    private let tintLayer = CALayer()

    public override func layoutSubviews() {
        super.layoutSubviews()
        tintLayer.frame = bounds
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    private func setup() {

        backgroundColor = UIColor(white: 1.0, alpha: 1)

        let brand = UIColor(red: 82/255, green: 18/255, blue: 32/255, alpha: 1)

        tintLayer.backgroundColor = brand.withAlphaComponent(0.015).cgColor
        
        layer.insertSublayer(tintLayer, at: 0)
    }
}
