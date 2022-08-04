# toy-move-packages

## Fungible-tokens

The fungible-tokens module contains a single "usdc" module.

To publish:

1. update `Sui = { local = "/Users/cl/ml/fastnft/crates/sui-framework" }` [fungible-tokens/Move.toml](fungible-tokens/Move.toml) to point to your sui repo directory
2. run `sui client publish --path {Replace with your path to toy-move-packages}/fungible-tokens --gas-budget 30000`

Example request:

```
➜ ./sui client publish --path /Users/cl/projects/toy-move-packages/fungible-tokens --gas-budget 30000
----- Certificate ----
Transaction Hash: uZcV3SI/k8180eFrn977lxEnYvey2U7mcCL5hA2q+aM=
Transaction Signature: AA==@Dcg6KUXkrY3vZ6OoW6KFKKbf9JhoMJYOF7DsOWJ+Uk50WkGGavKczmMLaqmVTzxh5/eqGtJKBHnQTUhaDfRRAw==@FnJ0t0fpTnvsVH/rXJOtq9Po2xxo5CxXpKcFrS89bxU=
Signed Authorities Bitmap: RoaringBitmap<[1, 2, 3]>
Transaction Kind : Publish
----- Publish Results ----
The newly published package object ID: 0x6ae6de6bc713b3afa2d01c391834b960be3aaef7

List of objects created by running module initializers:
----- Move Object (0x6efc4256416950ede7275367e6c30aae57e9b9fd[1]) -----
Owner: Account Address ( 0xa61db87d4c1be34629122d5befc47fb5bcf77e34 )
Version: 1
Storage Rebate: 16
Previous Transaction: uZcV3SI/k8180eFrn977lxEnYvey2U7mcCL5hA2q+aM=
----- Data -----
type: 0x2::coin::TreasuryCap<0x6ae6de6bc713b3afa2d01c391834b960be3aaef7::usdc::USDC>
id: 0x6efc4256416950ede7275367e6c30aae57e9b9fd
total_supply:
  type: 0x2::balance::Supply<0x6ae6de6bc713b3afa2d01c391834b960be3aaef7::usdc::USDC>
  value: 0

Updated Gas : Coin { id: 0x82246e7813579ab6a363749c3c1fe29320f5b6af, value: 99998387 }
```

Note that this transaction also transfer a `CAP Object` to the publisher address that has an id `0x6efc4256416950ede7275367e6c30aae57e9b9fd`. You will need to pass in this id for minting.

To mint and transfer USDC to `<ADDRESS A>`:

```
./sui client call --package <PACKAGE_ID> --module usdc --function mint --args 1000 <CAP Object ID> <ADDRESS A> --gas-budget 1000
```

Example request:

```
➜ ./sui client call --package 0x6ae6de6bc713b3afa2d01c391834b960be3aaef7 --module usdc --function mint --args 1000 0x6efc4256416950ede7275367e6c30aae57e9b9fd 0xa61db87d4c1be34629122d5befc47fb5bcf77e34 --gas-budget 1000
----- Certificate ----
Transaction Hash: KB+V2XcF0QnxKqE+ADRH3qwbxQCZQ/ZOt3x4CDGwIJA=
Transaction Signature: AA==@4dPCAzM2i7tPRQbAzl6HxQZ+Vjjd0wvxJ3LCOLjPJ6v58sqhrEniQCrOKV8+3Buom560Sg5yognZcTpsmVS+DQ==@FnJ0t0fpTnvsVH/rXJOtq9Po2xxo5CxXpKcFrS89bxU=
Signed Authorities Bitmap: RoaringBitmap<[1, 2, 3]>
Transaction Kind : Call
Package ID : 0x6ae6de6bc713b3afa2d01c391834b960be3aaef7
Module : usdc
Function : mint
Arguments : [1000, "0x6efc4256416950ede7275367e6c30aae57e9b9fd", "0xa61db87d4c1be34629122d5befc47fb5bcf77e34"]
Type Arguments : []
----- Transaction Effects ----
Status : Success
Created Objects:
  - ID: 0xe61b7b7617e29e836a9ad590413f42f23de3d967 , Owner: Account Address ( 0xa61db87d4c1be34629122d5befc47fb5bcf77e34 )
Mutated Objects:
  - ID: 0x6efc4256416950ede7275367e6c30aae57e9b9fd , Owner: Account Address ( 0xa61db87d4c1be34629122d5befc47fb5bcf77e34 )
  - ID: 0x82246e7813579ab6a363749c3c1fe29320f5b6af , Owner: Account Address ( 0xa61db87d4c1be34629122d5befc47fb5bcf77e34 )
```
