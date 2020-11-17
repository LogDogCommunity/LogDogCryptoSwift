import CryptoSwift
import LogDog

public extension LogSink where Output == Data {
    func encrypt(using cipher: Cipher) -> LogSinks.Concat<Self, LogSinks.CryptoSwift> {
        self + .init(cipher: cipher)
    }
}

public extension LogSinks {
    struct CryptoSwift: LogSink {
        public typealias Input = Data
        public typealias Output = Data

        public let cipher: Cipher

        public init(cipher: Cipher) {
            self.cipher = cipher
        }

        public func sink(_ record: LogRecord<Data>, next: @escaping LogSinkNext<Data>) {
            record.sink(next: next) { (record) -> Data? in
                let bytes = try self.cipher.encrypt(Array(record.output))
                return Data(bytes)
            }
        }
    }
}
