// Copyright (c) 2022, Mysten Labs, Inc.
// SPDX-License-Identifier: Apache-2.0

module fungible_tokens::usdc {
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::tx_context::{Self, TxContext};
    use sui::transfer;

    /// Name of the coin
    struct USDC has drop {}

    fun init(witness: USDC, ctx: &mut TxContext) {
        let treasury_cap = coin::create_currency<USDC>(witness, ctx);
        transfer::transfer(
            treasury_cap,
            tx_context::sender(ctx)
        )
    }

    /// Only the the owner of the treasury cap can mint new coins
    public entry fun mint(
        value: u64,
        cap: &mut TreasuryCap<USDC>,
        recipient: address,
        ctx: &mut TxContext
    ) {
        let coin = coin::mint<USDC>(cap, value, ctx);
        coin::transfer(coin, recipient)
    }


    /// Transfer to a recipient
    public entry fun transfer(c: Coin<USDC>, recipient: address, _ctx: &mut TxContext) {
        coin::transfer(c, recipient)
    }
}
