// See how to bind UI to Swift code.
// https://youtu.be/Opz3juSW43Q?t=140

import UIKit
import MessageUI

class ViewController: UIViewController, UITextViewDelegate, MFMailComposeViewControllerDelegate {

    //MARK: Properties
    @IBOutlet weak var lblMessage: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var txtvToken: UITextView!
    @IBOutlet weak var btnCopy: UIButton!
    
    @IBOutlet weak var btnSendByEmail: UIButton!
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.txtvToken.delegate = self
        self.txtvToken.layer.borderWidth = 1.0
        self.txtvToken.layer.borderColor = UIColor.blue.cgColor
        self.txtvToken.layer.cornerRadius = 5
        
        if isSwtGenerated() {
            self.btnCopy.isEnabled = true
            if !MFMailComposeViewController.canSendMail() {
                print("Mail services are not available")
                self.btnSendByEmail.isEnabled = false
                showAlert(msg: "Mail service was not configured on the iOS device!")
            } else {
                self.btnSendByEmail.isEnabled = true
            }
        } else {
            self.btnSendByEmail.isEnabled = false
            self.btnCopy.isEnabled = false
            showAlert(msg: "JWT token was not generated!")
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showAlert(msg: "Mail service was not configured on the iOS device!")
    }
    
    //MARK: Actions
    @IBAction func copyOnTouchInside(_ sender: Any) {
        UIPasteboard.general.string = txtvToken.text
        let jwt = UIPasteboard.general.string
        jwt.map {
            print("JWT: \($0)")
        }
    }
    @IBAction func onTouchInside(_ sender: UIButton) {
        if let jwt = Jwt.INSTANCE.value {
            print("Token: \(jwt)")
            txtvToken.text = "\(jwt)"
        } else {
            txtvToken.text = "<missing toke>"
        }
    }
    @IBAction func sendByEmailOnTouchInside(_ sender: Any) {
        let mail = MFMailComposeViewController()
        mail.mailComposeDelegate = self
        mail.setToRecipients(["you@yoursite.com"])
        mail.setSubject("APNs Auth Token")
        let jwt = Jwt.INSTANCE.value!
        mail.setMessageBody("\(jwt)", isHTML: false)
        present(mail, animated: true)
    }
    
    func isSwtGenerated() -> Bool {
        if Jwt.INSTANCE.value == nil {
            return true
        } else {
            return false
        }
    }
    
    func showAlert(msg: String) {
        // Create a new alert
        let dialogMessage = UIAlertController(title: "Attention", message: msg, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (_) -> Void in })
        dialogMessage.addAction(ok)

        // Present alert to user
        self.present(dialogMessage, animated: true, completion: nil)
    }
}
