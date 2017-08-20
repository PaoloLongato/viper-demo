//
//  ModuleARouter.swift
//  viper-demo
//
//  Created by Paolo Longato on 19/08/2017.
//  Copyright © 2017 Jayway. All rights reserved.
//

import UIKit

class ModuleARouter {
    
    var nextViewA: NextViewA?
    
    func goToA(from: ViewType) {
        guard let view = from as? View else { return }
        let newView = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewA") as! NextViewA
        let newModule = ModuleB(view: newView)
        (UIApplication.shared.delegate as! AppDelegate).secondModule = newModule
        view.navigationController?.pushViewController(newView, animated: true)
    }
    
    func goToB(from: ViewType) {
        guard let view = from as? View else { return }
        let newView = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewA") as! NextViewA
        let newModule = ModuleC(view: newView)
        (UIApplication.shared.delegate as! AppDelegate).thirdModule = newModule
        view.navigationController?.present(newView, animated: true)
    }
    
    private func addSegueObserver(view: View) {
        view.segueObserver = { [weak self] (destinationViewAny) in 
            guard let destinationView = destinationViewAny as? NextViewA else { return }
            self?.nextViewA = destinationView
        }
    }
}
