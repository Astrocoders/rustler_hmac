use hmac::{Hmac, Mac};
use sha2::Sha256;

type HmacSha256 = Hmac<Sha256>;

#[rustler::nif]
fn generate(secret: String, message: String) -> String {
    let mut mac =
        HmacSha256::new_from_slice(secret.as_bytes()).expect("HMAC can take key of any size");

    mac.update(message.as_bytes());

    let result = mac.finalize();

    let code_bytes = result.into_bytes();

    hex::encode(code_bytes)
}

rustler::init!("Elixir.RustlerHmac", [generate]);