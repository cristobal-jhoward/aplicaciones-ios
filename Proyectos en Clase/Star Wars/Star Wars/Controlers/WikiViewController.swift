//
//  WikiViewController.swift
//  Star Wars
//
//  Created by master on 11/01/2021.
//  Copyright © 2021 master. All rights reserved.
//

import UIKit
import WebKit

class WikiViewController: UIViewController, WKNavigationDelegate, WKUIDelegate {
    
    //Propiedades
    
    @IBOutlet weak var browser: WKWebView!
    
    @IBOutlet weak var activityView: UIActivityIndicatorView!
    
    var model : StarWarsCharacter
    
    //Inicializador
    
    init(model : StarWarsCharacter){
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //Ciclo de vida

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool){
        
        super.viewWillAppear(animated)
        
        syncModelWithView()
    }
    
    // Metodos de protocolo
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        activityView.stopAnimating()
        
        activityView.isHidden = true
        
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        
        if navigationAction.navigationType == .linkActivated || navigationAction.navigationType == .formSubmitted {
            
            decisionHandler(.cancel)
        }else{
            decisionHandler(.allow)
        }
    }
    
    // Metodos de utilidad

    func syncModelWithView(){
        browser.navigationDelegate = self
        
        activityView.startAnimating()
        
        browser.load(URLRequest(url: model.url))
    }
    

}
