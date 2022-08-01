defmodule RustlerHmac do
  version = Mix.Project.config()[:version]

  use RustlerPrecompiled,
    otp_app: :rustler_hmac,
    crate: "hmac",
    base_url: "https://github.com/Astrocoders/rustler_hmac/releases/download/v#{version}",
    force_build: System.get_env("RUSTLER_PRECOMPILATION") in ["1", "true"],
    version: version

  # When your NIF is loaded, it will override this function.
  def generate(_, _), do: :erlang.nif_error(:nif_not_loaded)
end
