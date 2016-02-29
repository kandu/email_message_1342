open Core_kernel.Std

module Headers= struct
  let word enc ctx=
    let base64_ctx=
      Email_message.Lexer.encode_base64 0 (Lexing.from_string ctx)
      |> Core_kernel.Bigbuffer.contents
    in
    sprintf "=?%s?B?%s?="
      enc
      base64_ctx
end

module Email_address = struct
  let create ?prefix ?domain name=
    let prefix= Option.map prefix ~f:(Headers.word "UTF-8") in
    Email_message.Email_address.create ?prefix ?domain name
end

module Simple = struct
  let create
    ?from
    ~to_
    ?cc
    ~subject
    ?id
    ?date
    ?extra_headers
    ?attachments
    content
  =
  let subject= Headers.word "UTF-8" subject in
  Email_message.Email.Simple.create
    ?from
    ~to_
    ?cc
    ~subject
    ?id
    ?date
    ?extra_headers
    ?attachments
    content
end

