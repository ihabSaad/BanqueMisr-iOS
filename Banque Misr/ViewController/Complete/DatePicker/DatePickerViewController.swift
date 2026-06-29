//
//  DatePicker ViewController.swift
//  Banque Misr
//
//  Created by ihab saad on 25/04/2026.
//

import UIKit

class DatePickerViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    
  
    var didSelectDate: ((Date) -> Void)?
    
    init() {
        super.init(nibName: String(describing: Self.self), bundle: Bundle(for: Self.self))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {

        super.viewDidLoad()
        view.backgroundColor = .clear
    }
    
    
    @IBAction func confirmTapped(_ sender: Any) {
        didSelectDate?(datePicker.date)
        dismiss(animated: true)
    }
    
    @IBAction func cancelTapped(_ sender: Any) {
        dismiss(animated: true)
    }
}
