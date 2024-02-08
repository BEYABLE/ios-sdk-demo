//
//  QuantityPickerViewDelegate.swift
//
//
//  Created by Brahim Ouamassi
//


// QuantityPickerView Delegate

protocol QuantityPickerViewDelegate: AnyObject {
  
  // ToolBar button actions
  func didTapDoneButtonOnToolBar()
  func didTapCancelButtonOnToolBar()
  
  // Picker update
  func didUpdatePickerView(with value: Int)
  
}
