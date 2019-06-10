#!/usr/bin/swift

import Foundation
import Security

let path = CommandLine.argc > 1 ? CommandLine.arguments[1] : "login.keychain"

var keychain: SecKeychain?
let open_success = SecKeychainOpen(path, &keychain)
if open_success != errSecSuccess {
    print(SecCopyErrorMessageString(open_success, nil)! as NSString)
    exit(open_success)
}

var status: SecKeychainStatus = 0
let status_success = SecKeychainGetStatus(keychain, &status)
if status_success != errSecSuccess {
    print(SecCopyErrorMessageString(status_success, nil)! as NSString)
    exit(status_success)
}

print("unlocked:", status & kSecUnlockStateStatus > 0)
print("readable:", status & kSecReadPermStatus > 0)
print("writable:", status & kSecWritePermStatus > 0)
