global DEPTH: u32 = 8;

use dep::std::hash::pedersen_hash;
use std::merkle::compute_merkle_root;

fn main(
    id: Field,
    r: Field,
    oldPath: [Field; DEPTH],
    oldRoot: pub Field,
    newRoot: pub Field,
    commitment: pub Field,
    leafIndex: pub Field,
    
) {
    // assure commitment == PedersenHash(id, r)
    assert(commitment == pedersen_hash([id, r]));

    // assure old root is valid for old path
    let oldLeaf = 0x18d85f3de6dcd78b6ffbf5d8374433a5528d8e3bf2100df0b7bb43a4c59ebd63;
    assert(oldRoot == compute_merkle_root(oldLeaf, leafIndex, oldPath));

    // check if new root matches with new leaf
    assert(newRoot == compute_merkle_root(commitment, leafIndex, oldPath));

}