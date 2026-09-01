# Security Policy

- Never commit passwords, tokens, private keys, environment files, Terraform state, kubeconfig or raw machine evidence.
- Pin third-party CI actions to immutable commit SHAs.
- Use reserved `.invalid` names and loopback addresses for examples and negative tests.
- Report credential exposure through a private GitHub security advisory; use regular issues for non-sensitive hardening work.
