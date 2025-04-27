global DEPTH: u32 = 8;

use dep::std::hash::pedersen_hash;
use std::merkle::compute_merkle_root;

fn main(
    r: Field,
    leafIndex: Field,
    path: [Field; DEPTH],
    root: pub Field,
    id: pub Field,

) {
    assert(root == compute_merkle_root(pedersen_hash([id, r]), leafIndex, path));
}