//
//  SettingsViewModel.swift
//  nearby
//
//  Created by Burak Kaya on 08.01.22.
//

import Foundation

protocol SettingsViewDataSource {}

protocol SettingsViewEventSource {}

protocol SettingsViewProtocol: SettingsViewDataSource, SettingsViewEventSource {}

final class SettingsViewModel: BaseViewModel<SettingsRouter>, SettingsViewProtocol {
    
}
