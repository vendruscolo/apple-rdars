//
//  CredentialProviderViewController.swift
//  Credentials Provider
//
//  Created by Alessandro Vendruscolo on 17/12/2019.
//  Copyright © 2019 AVEdesign. All rights reserved.
//

import AuthenticationServices

class CredentialProviderViewController: ASCredentialProviderViewController {

    @IBAction func cancel(_ sender: AnyObject?) {
        self.extensionContext.cancelRequest(withError: NSError(domain: ASExtensionErrorDomain, code: ASExtensionError.userCanceled.rawValue))
    }

    @IBAction func showMenuController(_ sender: UIButton?) {
        becomeFirstResponder()
        UIMenuController.shared.showMenu(from: self.view, rect: sender?.frame ?? .zero)
    }

    override var canBecomeFirstResponder: Bool {
        return true
    }

    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        return true
    }

}
