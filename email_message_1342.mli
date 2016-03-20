module Headers : sig val word : string -> string -> string end
module Email_address :
  sig
    val create :
      ?prefix:string ->
      ?domain:Email_message.Email_address.Domain.t ->
      string -> Email_message.Email_address.t
  end
module Simple :
  sig
    val create :
      ?from:Email_message.Email_address.t ->
      to_:Email_message.Email_address.t list ->
      ?cc:Email_message.Email_address.t list ->
      subject:string ->
      ?id:string ->
      ?date:Core.Std.Time.t ->
      ?extra_headers:(Email_message.Headers.Name.t *
                      Email_message.Headers.Value.t)
                     list ->
      ?attachments:(Email_message.Email.Simple.attachment_name *
                    Email_message.Email.Simple.Content.t)
                   list ->
      Email_message.Email.Simple.Content.t -> Email_message.Email.Simple.t
  end
