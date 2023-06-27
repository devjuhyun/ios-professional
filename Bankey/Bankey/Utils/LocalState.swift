 //
//  LocalState.swift
//  Bankey
//
//  Created by Juhyun Yun on 2023/06/26.
//

// Enum을 사용한 싱글톤인데 이해 안됨
// UserDefaults 사용법에 대해 좀 더 공부하기
import Foundation

public class LocalState {
    
    private enum Keys: String {
        case hasOnboarded
    }
     
    public static var hasOnboarded: Bool {
        
        get {
            return UserDefaults.standard.bool(forKey: Keys.hasOnboarded.rawValue)
        }
        
        set(newValue) {
            UserDefaults.standard.setValue(newValue, forKey: Keys.hasOnboarded.rawValue)
            UserDefaults.standard.synchronize() // race condition 방지, 자동으로 설정해줘서 이제 굳이 안적어도된다.
        }
    }
}
