# SwiftStream

Swiftを使ったStreamデータ構造のサンプル

# Streamとは

データを格納することが出来るデータ構造の一つです。
配列とは異なり、第２項以降の要素を関数で生成します。


# 何が出来るか

Haskellのリストのように、無限データを扱うことができます。
例として以下のように無限の整数列データを作ることが出来ます。

```infinite_integers.swift
func integers() -> Stream<Int> {
    func helper(_ n: Int) -> Stream<Int> {
        return Stream.cons(n, { (_) in
            return helper(n+1)
        })
    }
    return helper(0)
}
```


# LICENSE

このサンプルはMITオープンソースライセンスです。
