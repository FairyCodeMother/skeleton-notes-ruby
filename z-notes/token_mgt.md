
## Issuing tokens:

```rb
require 'jwt'
require 'openssl'

private_key = OpenSSL::PKey::RSA.generate(2048)

def issue_token(user_id:, tenant_id:, roles:)
  payload = {
    sub: user_id,
    tenant_id: tenant_id,
    roles: roles,
    iat: Time.now.to_i,
    exp: (Time.now + 15 * 60).to_i
  }

  JWT.encode(payload, private_key, 'RS256')
end
```

## Validating Tokens:
```rb
public_key = private_key.public_key

def validate_token(token)
  decoded = JWT.decode(token, public_key, true, algorithm: 'RS256')
  payload = decoded.first
  # Perform additional checks on roles, tenant_id, etc.
  payload
rescue JWT::ExpiredSignature
  raise 'Token has expired'
rescue JWT::DecodeError
  raise 'Invalid token'
end
```
