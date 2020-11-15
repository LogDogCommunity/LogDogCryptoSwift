# LogDogCryptoSwift

Encrypt the output of LogDog.

## Usage

```swift
let sink = LogSinks.firstly
    .encode(encoder: JSONEncoder())
    .encrypt(using: cipher)
```
