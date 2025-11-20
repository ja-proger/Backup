//
//  main.swift
//  BackupCalculator
//
//  Created by JA-Proger on 11/20/25.
//

import Foundation

/// Backup model created by the person, who is hiding his personality by the **[JA Proger](https://github.com/ja-proger)** psedonym
/// - Note: At **`day 1`** you have **`100 mb`**. Backup volume for the **`day 1`** is **`100 mb`**. During **`day 2`**, your data increased for **`10 mb`**. Backup for the **`day 2`** is **`110 mb`**. Hence, whole backup is **`sum of backups`** for **`day 1`** and **`day 2`**, therefore sum for **`n=2`** is **`100 + 110 = 210`**.
///  - This code solves problem of calculating backup volumes
/// ```swift
/// // MARK: - Inputs
/// let startV: Int = 100
/// let n: Int = 4
/// let a: [Int] = [30, 20, 50]
/// // MARK: - Sum
/// let backup: Backup = Backup(x: startV, n: n, a: a).sum
/// print(backup)
/// ```
public struct Backup {
    /// Start volume at fist unit of time.
    /// - Note: Unit of time can be a second, hour, day, etc
    public var x: Int
    
    /// Finish unit of time.
    /// - Note: for example you would backup data for 3 days, therefore `n = 3`.
    public var n: Int
    
    /// Additions to the startVolume.
    /// - Note: it can be static, so a.count = 1, it can be 0
    public var a: [Int]
    
    /// Sum of all backups
    public var sum: Int = 0
    
    // MARK: - inits
    
    /// All data is available
    public init(x: Int, n: Int, a: [Int]) {
        precondition(n - 1 == a.count, "ERROR[1]:\nQuantity of additions must be less then n or a.count have to be equal to n-1.")
        self.x = x
        self.n = n
        self.a = a
        self.sum = self.sumFull()
    }
    
    /// a = 0
    public init(x: Int, n: Int) {
        self.x = x
        self.n = n
        self.a = []
        self.sum = self.sumAIsZero()
    }
    /// a is static
    public init(x: Int, n: Int, a: Int) {
        self.x = x
        self.n = n
        self.a = [a]
        self.sum = self.sumAIsStatic()
    }
    /// n = 1
    public init(x: Int){
        self.x = x
        self.n = 1
        self.a = []
        self.sum = self.sumNIsOne()
    }
    
    // MARK: - Methods
    
    /// Calculate volume of the backup by the end of an ``n``
    /// - Returns :
    /// Full sum of backups for the period ``n``
    public func sumFull() -> Int {
        let firstPart: Int = self.n * self.x
        var sum: Int = 0
        
        for i in 1..<self.n {
            let ad: Int = (self.n - i) * self.a[i-1]
            sum += ad
        }
        let finalSum: Int = sum + firstPart
        return finalSum
    }
    
    /// Sum if **``a``** is zero.
    /// - Returns: Sum of backup if a is zero
    public func sumAIsZero() -> Int {
        return self.n * self.x
    }
    
    /// Sum if a is static
    /// - Note: In this case ``a`` is not an array.
    /// - Returns: Sum
    public func sumAIsStatic() -> Int {
        let firstPart: Int = self.n * self.x
        let aS: Int = self.a[0]
        var sum: Int = 0
        
        for i in 1..<self.n {
            let ad: Int = (self.n - i) * aS
            sum += ad
        }
        let finalSum: Int = sum + firstPart
        return finalSum
    }
    
    /// Sum if ``n`` is 1
    /// - Returns: sum
    public func sumNIsOne() -> Int {
        return self.x
    }
    
}

// MARK: - Command line mode

func main() {
    // x is 100 mb
    let x: Int = 100
    // n is 4 days
    let n: Int = 4
    // array of additions a
    let a: [Int] = [30, 50, 30]
    let backup: Backup = Backup(x: x, n: n, a: a)
    let sum: Int = backup.sum
    print(sum)
}

main()






