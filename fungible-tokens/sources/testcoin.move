// // Copyright (c) 2022, Mysten Labs, Inc.
// // SPDX-License-Identifier: Apache-2.0

// module fungible_tokens::testcoin {
//     use sui::coin::{Self, Coin};
//     use sui::tx_context::{Self, TxContext};
//     use sui::transfer;

//     /// Name of the coin
//     struct TEST has drop {}

//     fun init(witness: TEST, ctx: &mut TxContext) {
//         // let treasury_cap = coin::create_currency<TEST>(witness, ctx);
//         // transfer::share_object(treasury_cap)
//         let treasury_cap = coin::create_currency<TEST>(witness, ctx);
//         transfer::transfer(treasury_cap, tx_context::sender(ctx))
//     }

//     /// Transfer to a recipient
//     public entry fun transfer(c: Coin<TEST>, recipient: address, _ctx: &mut TxContext) {
//         transfer::transfer(c, recipient)
//     }
// }

module fungible_tokens::test {
    use sui::coin::{Self};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    /// Name of the coin. By convention, this type has the same name as its parent module
    /// and has no fields. The full type of the coin defined by this module will be `COIN<TEST>`.
    struct TEST has drop {}

    /// Register the TEST currency to acquire its `TreasuryCap`. Because
    /// this is a module initializer, it ensures the currency only gets
    /// registered once.
    fun init(witness: TEST, ctx: &mut TxContext) {
        // Get a treasury cap for the coin and give it to the transaction sender
        let treasury_cap = coin::create_currency<TEST>(witness, ctx);
        transfer::share_object(treasury_cap)
    }

    // /// Transfer to a recipient
    // public entry fun transfer(c: Coin<TEST>, recipient: address, _ctx: &mut TxContext) {
    //     transfer::transfer(c, recipient)
    // }
}
