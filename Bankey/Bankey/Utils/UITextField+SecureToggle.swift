//
//  UITextField+SecureToggle.swift
//  Bankey
//
//  Created by 이승민 on 5/28/24.
//

import UIKit

let passwordToggleButton = UIButton(type: .custom)

extension UITextField {
    
    // 비밀번호 표시 버튼
    func enablePasswordToggle(){
        passwordToggleButton.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        passwordToggleButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .selected)
        passwordToggleButton.addTarget(self, action: #selector(togglePasswordView), for: .touchUpInside)
        rightView = passwordToggleButton
        rightViewMode = .always
    }
    
    @objc func togglePasswordView(_ sender: Any) {
        isSecureTextEntry.toggle()
        passwordToggleButton.isSelected.toggle()
    }
}
