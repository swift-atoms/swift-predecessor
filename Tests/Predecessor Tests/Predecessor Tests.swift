import Subtraction
import Predecessor
import Testing

@Suite
struct `Predecessor checks and saturates movement to the previous value` {

    @Test
    func `Predecessor reports and throws at the least value`() {
        let report = Predecessor.reporting(UInt.zero)
        #expect(report.value == UInt.max)
        #expect(report.overflow)
        #expect(throws: Subtraction.Error.overflow) {
            try Predecessor.exact(UInt.zero)
        }
    }

    @Test
    func `Exact and saturating predecessor operations select the previous value`() throws {
        #expect(try Predecessor.exact(UInt(42)) == 41)
        #expect(Predecessor.saturating(UInt.zero) == .zero)
    }
}
