# mpcoin

mpcoin is a simple fungible token smart contract for the Stacks blockchain, managed with [Clarinet](https://docs.hiro.so/clarinet).

## Prerequisites

- [Rust](https://www.rust-lang.org/tools/install)
- [Clarinet](https://docs.hiro.so/clarinet)

Verify Clarinet is installed:

```bash path=null start=null
clarinet --version
```

## Project structure

- `Clarinet.toml` – Clarinet project configuration
- `contracts/mpcoin.clar` – mpcoin fungible token contract
- `settings/` – network settings (Devnet/Testnet/Mainnet)
- `tests/mpcoin.test.ts` – test scaffold for the contract

## Contract overview

The `mpcoin` contract:

- Defines a fungible token `mpcoin`
- Tracks a `contract-owner` who can mint new tokens
- Allows any holder to transfer tokens they own
- Allows the owner to transfer ownership of the contract

### Key functions

- `get-contract-owner` – returns the current contract owner
- `get-balance (who principal)` – returns the mpcoin balance of `who`
- `transfer (amount uint) (sender principal) (recipient principal)` – transfer tokens from `sender` to `recipient` (must be called by `sender`)
- `mint (amount uint) (recipient principal)` – mint new tokens to `recipient` (only callable by `contract-owner`)
- `set-contract-owner (new-owner principal)` – change contract ownership (only current owner)

## Development

Run a syntax and type check on all contracts:

```bash path=null start=null
clarinet check
```

Run tests (after installing dependencies):

```bash path=null start=null
npm install
npm test
```

## Running a local Devnet

Start a local Devnet for interactive testing:

```bash path=null start=null
clarinet integrate
```

Then follow the prompts and use the Clarinet console to call contract functions.

## License

See `LICENSE` for license information.
